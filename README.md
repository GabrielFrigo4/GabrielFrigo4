# E aí, eu sou o Gabriel Frigo! 👾

> **Estudante de Ciência da Computação e BC&T na UFABC**<br />
> _Baixa Abstração, Engenharia de Sistemas, Fundamentos de UNIX, Computação Gráfica & Otimização Combinatória_

Troquei as competições de matemática e astronomia (onde conquistei algumas medalhas) para me dedicar ao que realmente me move: resolver problemas de alta densidade algorítmica, codar perto do metal e entender **como as coisas realmente funcionam por baixo dos panos** — do silício ao userspace.

---

## 🧠 Filosofia de Engenharia: A Tríade Canônica

Rejeito os dois extremos rasos do desenvolvimento de software: **a alienação das caixas-pretas de altíssimo nível** (que escondem a mecânica do hardware e do kernel) e **a burocracia bizantina desnecessária** (como escrever 1.500 linhas de boilerplate manual em Vulkan ou DirectX 12 direto só para desenhar uma primitiva na tela).

Busco o **equilíbrio de ouro**: fundamentos sólidos e perenes combinados com uma vanguarda pragmática, sem inchaço operacional.

```mermaid
flowchart TD
    subgraph S1 ["🏛️ 1. Fundamentos, Sistemas & Perto do Metal"]
        direction LR
        UNIX["UNIX / POSIX / BSD<br/>FreeBSD • OpenBSD • Linux • PF<br/>VFS • Sockets • /dev • ioctl • kqueue"]
        SEC["Capacidades & Segurança<br/>Capsicum • Pledge • Unveil • CHERI"]
        HW["Hardware & Silício<br/>Assembly • VHDL • FPGA"]
        HIST["Padrões Clássicos<br/>OpenGL • OpenCL • OpenAL"]
        UNIX ~~~ SEC ~~~ HW ~~~ HIST
    end

    subgraph S2 ["⚡ 2. Vanguarda Pragmática & Mínimo Denominador"]
        direction LR
        SDL_PHIL["Filosofia SDL & POSIX<br/>Mínimo Denominador da Indústria<br/>Estabilidade sem Hype Efêmero"]
        MOD_GPU["GPU & Áudio Nativo<br/>SDL_GPU • WebGPU • QRhi<br/>OSS • ALSA • SDL_Audio"]
        SYS_PRAG["Sistemas, Web & Dados<br/>C23 • C++23 • Rust • Go • Zig • Svelte<br/>SQLite • PostgreSQL • MySQL/MariaDB • PocketBase"]
        SDL_PHIL ~~~ MOD_GPU ~~~ SYS_PRAG
    end

    subgraph S3 ["🎯 3. Ciência & Rigor Algorítmico"]
        direction LR
        OPT["Otimização Combinatória & Grafos<br/>Network Flows • DIMACS"]
        CP["Programação Competitiva<br/>ICPC • Codeforces"]
        OPT ~~~ CP
    end

    S1 --> S2 --> S3
```

### 1. O Núcleo UNIX: (FD + ID), o Suco do Low-Level & Capabilities

Se você olhar por baixo do capô de qualquer sistema Unix-like (FreeBSD, Linux, OpenBSD, macOS), a infraestrutura do sistema operacional se resume a duas primitivas fundamentais:

- **File Descriptors (FD):** Onde e como você atua no stream do sistema. Sockets _são_ descritores de arquivo. Pipes, FIFOs, arquivos no VFS, dispositivos em `/dev`, multiplexação de eventos (`kqueue`/`epoll`) e o próprio subsistema de áudio. Quando o sistema é modelado com elegância, **tudo pode e deve ser um descritor de arquivo**.
    - _O Teste do Áudio:_ No **OSS (Open Sound System)** do FreeBSD, você simplesmente roda:
        ```sh
        cat /dev/dsp > /dev/dsp
        ```
        e escuta instantaneamente a sua voz no microfone saindo nas caixas de som, porque áudio é um stream puro no VFS. Enquanto isso, no Linux, você encara a bomba do ALSA com 1001 APIs monstruosas, camadas complexas e intermediários desnecessários.
- **Identifiers & Credenciais (ID):** Quem é o sujeito que atua no sistema. UID, GID, EUID, PID e as fronteiras de autorização de processos.

#### As Técnicas que Nascem da União de FD e ID:

- **Privilege Separation (PrivSep):** A técnica magistral consagrada pelo OpenBSD (e projetos como o OpenSSH). O processo mestre faz `fork()`, passa descritores pré-autorizados via sockets UNIX (`sendmsg`/`SCM_RIGHTS`), e o processo filho derruba privilégios trocando de ID e trancando o próprio espaço de execução com `pledge(2)` e `unveil(2)`. Segurança real nasce do isolamento estrito de FDs e IDs.
- **Containers & Sandboxes:** Na prática, nada além de isolamento de IDs (UID/GID namespaces) e confinamento defensivo de FDs e diretórios no VFS.
- **CUSE (Character Devices in Userspace) & Drivers:** A capacidade de expor drivers e objetos de kernel diretamente como nós de `/dev` operáveis via chamadas clássicas (`read`, `write`, `ioctl`).

#### E Fora de ID e FD? O Suco do Low-Level Bruto:

Se ID e FD cuidam da infraestrutura do sistema operacional, o que resta fora deles é o suco puro do bare-metal:

- **Instruções e Registradores da CPU:** Assembly puro, microarquitetura, pipelines de execução e controle de registradores.
- **Hierarquia de Memória:** Memória física, memória virtual (VMM), páginas, TLB e comportamento de caches L1/L2/L3.
- **O Kernel Interno:** O escalonador de processos (_scheduler_), tratamento de interrupções de hardware e context switches.

#### A Próxima Fronteira: Unificando ID e FD em Capabilities

O próximo salto da engenharia é a unificação do FD e do ID em uma única abstração: **Capabilities**. Um descritor que já carrega consigo, inseparavelmente, os direitos e o escopo de autorização:

- _No nível de software:_ **Capsicum** (FreeBSD), eliminando o namespace global e operando exclusivamente sobre direitos delegados em tempo de execução.
- _No nível do silício:_ **CHERI** e **CheriBSD**, estendendo a arquitetura de registradores e instruções da CPU para impor segurança de memória com integridade espacial e temporal em nível de hardware.

### 2. A Filosofia SDL & POSIX: O Mínimo Denominador Comum

Existe uma profunda simetria entre o **POSIX** e a **SDL (Simple DirectMedia Layer)**:

- Ambos se recusam a perseguir hypes passageiros ou reinventar a roda a cada ciclo da moda.
- Ambos operam como o **mínimo denominador comum** universal que permite a plataformas, drivers, displays e placas de som conversarem exatamente a mesma língua.
- Não são tecnologias defasadas: são **maduras, ultra-estáveis e impecáveis no que se propõem a fazer**.
- **A GPU Moderna sem Fricção Bizantina:** Adoção de **SDL_GPU**, **WebGPU** e **QRhi** — modelam a arquitetura real das placas modernas (pipelines imutáveis, command buffers, bind groups e barreiras explícitas) sem a loucura de 1.500 linhas de boilerplate bare-metal em Vulkan ou DirectX 12 só pra desenhar um triângulo, e longe de caixas-pretas alienantes (SFML, Raylib).
- **Computação Paralela Massiva (GPGPU):** Domínio de **NVIDIA CUDA** para processamento vetorial de alto desempenho em GPU, escalonamento massivo em warps e memória compartilhada.
- **Áudio Nativo & Padrões Gráficos:**
    - **OSS (Open Sound System):** A elegância do `/dev/dsp` e ioctl direto no FreeBSD, sem servidores de som intermediários consumindo CPU e adicionando latência.
    - **ALSA & SDL Audio:** Suporte a baixo nível no Linux e a camada unificada e consistente do SDL3.
    - **OpenGL**, **OpenCL** e **OpenAL**: Preservados e estudados como marcos clássicos formativos e legados históricos da computação gráfica, GPGPU e áudio 3D.

### 3. Sistemas, Arquitetura & Bancos de Dados: Do Monólito à Nuvem

Frameworks e hypes são efêmeros; filosofias arquiteturais e dados confiáveis permanecem:

- **O Poder do Monólito Sem Preconceito (SQLite WAL):** Rejeição ao preconceito raso contra o SQLite. Quando operado em modo WAL (_Write-Ahead Logging_) com transações otimizadas, o SQLite é uma força titânica: entrega latência de nanossegundos em memória e VFS, integridade ACID estrita em arquivo único, zero dependência de daemon em segundo plano e zero sobrecarga de rede. Para serviços locais, sistemas autônomos e monólitos coesos, sua eficiência operacional é imbatível.
- **A Tríade Relacional em Escala (PostgreSQL, MySQL / MariaDB):** Reconhecer a força do SQLite não significa ingenuidade arquitetural: nem tudo se resolve com banco embutido, nem localmente nem na nuvem. Quando o domínio exige concorrência massiva multi-writer, particionamento declarativo, isolamento distribuído, consultas geoespaciais avançadas (PostGIS) ou documentos JSONB indexados com estruturas GIN, o **PostgreSQL** é o padrão-ouro definitivo de engenharia relacional. Paralelamente, **MySQL** e **MariaDB** representam a espinha dorsal madura e hiper-testada da web, ideais para cargas de alta leitura e topologias de replicação tradicionais comprovadas em batalha. A regra de ouro é escolher a tecnologia pela densidade da carga e pelo contexto real, nunca por dogma.
- **PocketBase & Let's Encrypt:** Um estudo de caso vivo dessa filosofia de simplicidade e baixo atrito operacional. Go puro, SQLite WAL integrado e provisionamento automático de certificados SSL/TLS via **Let's Encrypt** nativo (sem a necessidade burocrática de proxies reversos complexos como Nginx ou Traefik em deploys autônomos). Se um serviço não exige escala planetária distribuída, não há sentido em pagar o custo cognitivo de 50 microsserviços. Cada contexto dita sua solução ideal.
- **Frontend Anti-Inchaço & O Compilador do Svelte ([svelte.dev](https://svelte.dev/)):** A mesma aversão ao inchaço que governa o terminal e o backend aplica-se à web. Rejeição frontal ao monstro de dependências do ecossistema tradicional e à sobrecarga artificial de Virtual DOMs em tempo de execução. O **Svelte** e o **SvelteKit** operam sob o paradigma do **compilador**: em vez de carregar um runtime mastodôntico no navegador, o Svelte compila componentes diretamente em JavaScript cirúrgico e reativo em tempo de build. É a composição ideal com backends enxutos em **Go** e **PocketBase** (cuja UI administrativa nativa é escrita em Svelte!) e com o **Sylve** do FreeBSD — garantindo bundles minúsculos, renderização instantânea e zero desperdício de recursos.
- **Infraestrutura Soberana Multi-OS & Packet Filter (PF):**
    - **FreeBSD:** Estação de trabalho primária e servidores bare-metal, explorando orquestração moderna com **Sylve** (Jails e virtualização bhyve sobre datasets OpenZFS) e segurança por capabilities com **Capsicum**.
    - **OpenBSD:** A referência máxima em pureza de código, simplicidade arquitetural e segurança proativa por design, com isolamento estrito de processos via `pledge(2)` e `unveil(2)`.
    - **Linux:** O motor universal de servidores em nuvem, contêineres e nós de processamento distribuído de alto desempenho.
    - **illumos (OpenIndiana / SmartOS):** A linhagem clássica e refinada do UNIX Solaris/SunOS, oferecendo **Solaris Zones** nativas, isolamento de rede virtualizado via **Crossbow** e rastreabilidade dinâmica cirúrgica de kernel com **DTrace**.
    - **PF (Packet Filter):** O padrão definitivo de firewall e engenharia de tráfego de rede defensiva nos BSDs, combinando regras declarativas limpas, NAT de alta velocidade e controle fino de estados no kernel.

### 4. Ciência, Algoritmos & Maratonas

- **Iniciação Científica (UFABC / PIBIC):** Pesquisa focada em Problemas de Fluxos em Redes (_Network Flows_: Fluxo Máximo e Fluxo de Custo Mínimo), implementações de alta fidelidade em C++23 e validação com instâncias canônicas da DIMACS.
- **Programação Competitiva:** Membro da equipe GRUB da UFABC. Treinamento intensivo focado na **Final Nacional do ICPC 2026**, Codeforces, Maratona Paulista e OBI.

---

## ⚡ Ferramental Hacker: Editores Modais, Shells & IA Socrática

### Editores Modais & Ergonomia de Teclado

Navegação orientada a texto puro, latência imperceptível e controle estrito das mãos no teclado sem a dependência dispersiva do mouse:

- **Helix:** O editor modal moderno por excelência. Seleção-ação invertida (`selection -> action`), tree-sitter nativo out-of-the-box e LSP integrado sem atrito de configuração.
- **Vim & NeoVim:** O padrão atemporal e sua evolução moderna extensível com Lua, explorando todo o poder de syntax trees e plugins assíncronos.
- **GNU Emacs:** Mais do que um editor, uma plataforma computacional Lisp completa. Configurado de ponta a ponta com o gerenciador de pacotes transacional **Elpaca**, LSP nativo via **Eglot**, **Org Mode** para gestão de tarefas e conhecimento, e ciclo de vida conectado via **daemon/socket Unix** nativo.
- **Code-OSS / VS Code:** Preservado para depuração visual assistida, inspeções gráficas e ecossistemas específicos onde a interface visual acelera fluxos pontuais.

### Shells & Runtimes de Terminal: Do POSIX ao Windows

Uma estação de trabalho soberana e resiliente exige consistência entre sistemas operacionais, com uma taxonomia clara de execução e ergonomia:

- **Ambientes UNIX / POSIX (`Environment/Shell`):**
    - **Zsh:** Shell interativo primário com 100% de suporte, focado em máxima produtividade, autocompletion preditivo e ergonomia diária de prompt.
    - **Bash:** O cavalo de batalha universal com 100% de suporte para portabilidade estrita em contêineres, servidores headless e automação CI/CD.
    - **FreeBSD `/bin/sh`:** O shell nativo do FreeBSD — ultra-rápido, estritamente POSIX, sem inchaço e sem dependências externas.
    - **OpenBSD `/bin/ksh`:** KornShell canônico focado em minimalismo, segurança inabalável e conformidade de sistema.
    - _Rejeição Deliberada:_ Descarte de shells que quebram a semântica POSIX padrão (como Dash em modo interativo ou Fish), garantindo scripts reproduzíveis em qualquer máquina.
- **Ambientes Windows:**
    - **PowerShell (`pwsh`):** Para automação nativa robusta orientada a objetos no subsistema Windows.
    - **Nushell (`nu`):** Paradigma moderno de pipelines com tabelas de dados estruturados e tipagem estrita no terminal.
    - **Command Prompt (`cmd.exe`) com Clink:** O prompt nativo do Windows turbinado com **Clink**, que injeta dinamicamente a biblioteca **GNU Readline** e scripting **Lua** (`profile.lua`), trazendo auto-sugestões, histórico persistente inteligente e keybindings Vi diretamente para o terminal legado.

### Inteligência Artificial Agêntica & O Método Socrático

O uso de inteligência artificial generativa em engenharia de software não deve ser um atalho preguiçoso ("vibe coding"), mas sim uma ferramenta de **amplificação cognitiva de altíssimo rigor**:

- **A Plataforma Google Antigravity:** Adoção e domínio profundo de todo o ecossistema Antigravity — **Antigravity CLI (`agy`)**, **Antigravity IDE**, **Antigravity 2.0** e o **Python SDK**, operando com workflows agênticos autônomos e controle total de ferramentas de sistema.
- **Engenharia de Contexto & IA como Tutora:** A IA opera como pair programmer, tutora epistemológica e arquiteta técnica orientada por contratos declarativos estritos: **Portable AI Skills (`SKILL.md`)** para conhecimento procedural especializado, **`AGENTS.md`** para diretrizes operacionais de cada repositório e **`PRINCIPLES.md`** para axiomas inegociáveis de design de software.
- **O Método Socrático com IA (Epistemologia Rigorosa):**
    > **Perguntar sempre, a toda hora e sobre tudo.** Jamais aceitar as afirmações de um modelo de linguagem como verdades consolidadas até que sejam submetidas a validações empíricas, testes adversariais e comprovação formal. No desenvolvimento de software perto do metal, **99% de certeza não basta** — o 1% restante é precisamente onde residem vazamentos de memória, undefined behaviors e falhas silenciosas de concorrência. A IA deve ser usada como uma contraparte socrática dialética: desafiando hipóteses, questionando decisões de arquitetura e elevando o rigor técnico a 100%.
- **A Primazia do Compilador Determinístico (Garantias Matemáticas > Alucinações de IA):**
    > Prefiro infinitamente o rigor inabalável de um **compilador determinístico** me auxiliando do que depender cegamente de qualquer inteligência artificial. É exatamente por isso que amo linguagens com sistemas de tipos fortes e compiladores intransigentes como **Rust, Zig, C, C++ e Go** (e o próprio **Svelte** no frontend): um compilador estrito não tem "humores", não alucina e não aceita suposições — ele impõe tipos, tempo de vida de memória, integridade estrutural e garantias matemáticas sólidas em tempo de compilação. Se o compilador validou o código e gerou o binário, temos garantias axiomáticas que nenhuma heurística probabilística jamais conseguirá entregar. A IA é uma excelente assistente socrática e parceira de ideação, mas o compilador determinístico e a verificação formal são os árbitros supremos da verdade técnica.

---

## 🏛️ O Sexteto de Engenharia (Os 6 Hubs Federados)

Meu GitHub é estruturado em torno de **6 ecossistemas federados e soberanos**, cada um atuando como um hub orquestrador independente:

| Hub                                                               | Foco & Responsabilidade                                          | Tecnologias Centrais             | Componentes Canônicos                               |
| :---------------------------------------------------------------- | :--------------------------------------------------------------- | :------------------------------- | :-------------------------------------------------- |
| [**`environment`**](https://github.com/GabrielFrigo4/environment) | Orquestrador de estações de trabalho e dotfiles soberanos        | POSIX Shell, Elisp, Lua, C       | `Setup`, `Shell`, `Vault`, `Profile`, `Editores`    |
| [**`foundation`**](https://github.com/GabrielFrigo4/foundation)   | Utilitários de sistema, elevação de privilégios e acervo técnico | C99, POSIX.1, LaTeX, Git         | `Sysutils` (`rtdo`/`rtgo`), `Library`, `Raw Text`   |
| [**`research`**](https://github.com/GabrielFrigo4/research)       | Pesquisa acadêmica em Otimização Combinatória e Grafos           | C++23, LaTeX, DIMACS             | `Network Flow` (Fluxo Máximo e Custo Mínimo, Livro) |
| [**`training`**](https://github.com/GabrielFrigo4/training)       | Hub de maratonas algorítmicas e programação competitiva          | C++23, Rust, Python, Bash        | `Algorithms` (Templates, CLI `cpt`), `Marathon`     |
| [**`personal`**](https://github.com/GabrielFrigo4/personal)       | Engines de jogos, protocolos, servidores e laboratórios          | C/C++, Rust, SDL3, Lisp, Sockets | `Engines`, `Systems`, `Labs`, `Identity`, `OSS`     |
| [**`venture`**](https://github.com/GabrielFrigo4/venture)         | Soluções de mercado, logística operacional e produtos            | Go, Google OR-Tools, PocketBase  | `OptiLaser` (Motor VRPTW & Copiloto)                |

---

## 🛠️ Stack Tecnológico & Domínios

### Sistemas Operacionais & Ambientes de Host

![FreeBSD](https://img.shields.io/badge/FreeBSD-Primary_Workstation-red?logo=freebsd&logoColor=white)
![OpenBSD](https://img.shields.io/badge/OpenBSD-Security_%26_Purity-yellow?logo=openbsd&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Servers_%26_Cloud-blue?logo=linux&logoColor=white)
![illumos](https://img.shields.io/badge/illumos-Zones_%26_DTrace-orange?logo=openzfs&logoColor=white)
![Windows](<https://img.shields.io/badge/Windows_(MSYS2)-Tooling_%26_Clink-purple?logo=gitforwindows&logoColor=white>)
![CheriBSD](https://img.shields.io/badge/CheriBSD-Capabilities_Research-darkred?logo=freebsd&logoColor=white)

### Infraestrutura Soberana, Redes & Perto do Metal

![Packet Filter](<https://img.shields.io/badge/PF-Packet_Filter_(BSD)-1b4332?logo=openbsd&logoColor=white>)
![Sylve](https://img.shields.io/badge/Sylve-bhyve_%26_Jails-blue?logo=freebsd&logoColor=white)
![OpenZFS](https://img.shields.io/badge/Storage-OpenZFS-black?logo=openzfs&logoColor=white)
![POSIX](https://img.shields.io/badge/Standard-POSIX.1-black?logo=ieee&logoColor=white)
![Hardware](https://img.shields.io/badge/Sil%C3%ADcio-Assembly_%2F_VHDL_%2F_FPGA-teal?logo=riscv&logoColor=white)

### Linguagens de Programação

![C](https://img.shields.io/badge/C-C99_%2F_C23-00599C?logo=c&logoColor=white)
![C++](https://img.shields.io/badge/C++-C++20_%2F_C++23-00599C?logo=cplusplus&logoColor=white)
![Rust](https://img.shields.io/badge/Rust-Systems_%26_Async-DEA584?logo=rust&logoColor=white)
![Go](https://img.shields.io/badge/Go-Backend_%26_Concurrency-00ADD8?logo=go&logoColor=white)
![Zig](https://img.shields.io/badge/Zig-Toolchain_%26_Systems-F7A41D?logo=zig&logoColor=white)
![C#](https://img.shields.io/badge/C%23-DotNet-512BD4?logo=dotnet&logoColor=white)
![Scala](https://img.shields.io/badge/Scala-Functional-DC322F?logo=scala&logoColor=white)
![Python](https://img.shields.io/badge/Python-Scripting_%26_CP-3776AB?logo=python&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-Embedded-2C2D72?logo=lua&logoColor=white)
![Lisp](https://img.shields.io/badge/Lisp-Common_Lisp_%26_Elisp-purple?logo=commonlisp&logoColor=white)

### Computação Gráfica, GPU & Áudio

![SDL3](https://img.shields.io/badge/Runtime-SDL3-informational?logo=c&logoColor=white)
![SDL_GPU](https://img.shields.io/badge/GPU-SDL__GPU-blue?logo=vulkan&logoColor=white)
![NVIDIA CUDA](https://img.shields.io/badge/GPGPU-NVIDIA_CUDA-76B900?logo=nvidia&logoColor=white)
![SDL_Audio](https://img.shields.io/badge/Audio-SDL__Audio-blue?logo=airplayaudio&logoColor=white)
![WebGPU](https://img.shields.io/badge/GPU-WebGPU-orange?logo=webgpu&logoColor=white)
![QRhi](https://img.shields.io/badge/GPU-QRhi-green?logo=qt&logoColor=white)
![OSS](https://img.shields.io/badge/Audio-OSS-purple?logo=freebsd&logoColor=white)
![ALSA](https://img.shields.io/badge/Audio-ALSA-blue?logo=linux&logoColor=white)
![ImGui](https://img.shields.io/badge/Tooling-Dear_ImGui-red?logo=cplusplus&logoColor=white)
![GLFW](https://img.shields.io/badge/Context-GLFW3-black?logo=opengl&logoColor=white)
![GLAD](https://img.shields.io/badge/Loader-GLAD_1_%26_2-gray?logo=opengl&logoColor=white)
![OpenGL](https://img.shields.io/badge/Historical-OpenGL-5586A4?logo=opengl&logoColor=white)
![OpenCL](https://img.shields.io/badge/Historical-OpenCL-blue?logo=khronosgroup&logoColor=white)
![OpenAL](https://img.shields.io/badge/Historical-OpenAL-darkblue?logo=airplayaudio&logoColor=white)

### Frontend Compilado & Ecossistema Web

[![Svelte](https://img.shields.io/badge/Frontend-Svelte-FF3E00?logo=svelte&logoColor=white)](https://svelte.dev)
[![SvelteKit](https://img.shields.io/badge/Framework-SvelteKit-FF3E00?logo=svelte&logoColor=white)](https://svelte.dev)
![PocketBase](https://img.shields.io/badge/Backend-PocketBase-B8DBE8?logo=pocketbase&logoColor=white)
![Let's Encrypt](https://img.shields.io/badge/Security-Let's_Encrypt-003A70?logo=letsencrypt&logoColor=white)

### Bancos de Dados Relacionais & Motores de Decisão

![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-4169E1?logo=postgresql&logoColor=white)
![MySQL](https://img.shields.io/badge/Database-MySQL-4479A1?logo=mysql&logoColor=white)
![MariaDB](https://img.shields.io/badge/Database-MariaDB-003545?logo=mariadb&logoColor=white)
![SQLite](https://img.shields.io/badge/Database-SQLite-003B57?logo=sqlite&logoColor=white)
![OR-Tools](https://img.shields.io/badge/Solvers-Google_OR--Tools-4285F4?logo=google&logoColor=white)

### Editores & Ambientes de Desenvolvimento

![Helix](https://img.shields.io/badge/Helix-Modal_Editor-2B2937?logo=helix&logoColor=white)
![GNU Emacs](https://img.shields.io/badge/GNU_Emacs-Elpaca_%26_Eglot-7F5AB6?logo=gnuemacs&logoColor=white)
![Neovim](https://img.shields.io/badge/Neovim-Lua_%26_Treesitter-57A143?logo=neovim&logoColor=white)
![Vim](https://img.shields.io/badge/Vim-Modal_Classic-019733?logo=vim&logoColor=white)
![VS Code](https://img.shields.io/badge/VS_Code-Code--OSS-007ACC?logo=vscodium&logoColor=white)

### Shells & Runtimes de Terminal

![Zsh](https://img.shields.io/badge/Zsh-Interactive_Power-blue?logo=zsh&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-Universal_POSIX-green?logo=gnubash&logoColor=white)
![FreeBSD sh](https://img.shields.io/badge/FreeBSD_sh-Pure_POSIX-red?logo=freebsd&logoColor=white)
![OpenBSD ksh](https://img.shields.io/badge/OpenBSD_ksh-Minimal_Korn-yellow?logo=openbsd&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-pwsh-5391FE?logo=gitforwindows&logoColor=white)
![Nushell](https://img.shields.io/badge/Nushell-Structured_Data-4E9A06?logo=nushell&logoColor=white)
![CMD + Clink](https://img.shields.io/badge/CMD-Clink_%26_Lua-4A5568?logo=lua&logoColor=white)

### Plataformas de IA & Engenharia de Contexto

![Antigravity](https://img.shields.io/badge/Google_Antigravity-CLI_%26_IDE_%26_2.0-4285F4?logo=google&logoColor=white)
![Antigravity SDK](https://img.shields.io/badge/Antigravity-Python_SDK-3776AB?logo=python&logoColor=white)
![AI Skills](https://img.shields.io/badge/AI_Governance-Skills_%26_AGENTS.md-teal?logo=agentskills&logoColor=white)
![Socratic Inquiry](https://img.shields.io/badge/Epistemologia-M%C3%A9todo_Socr%C3%A1tico-purple?logo=academia&logoColor=white)

---

## 📊 Métricas e Performance

<div align="center">
  <table>
    <tr>
      <td align="center">
        <a href="https://github.com/GabrielFrigo4">
          <img src="https://github-readme-stats-beta-lime-83.vercel.app/api?username=GabrielFrigo4&show_icons=true&theme=radical&include_all_commits=true&count_private=true&v=4" alt="GitHub Stats" />
        </a>
        <br><br>
        <a href="https://github.com/GabrielFrigo4">
          <img src="https://github-readme-stats-beta-lime-83.vercel.app/api/top-langs/?username=GabrielFrigo4&layout=compact&langs_count=6&theme=radical&hide=html,css" alt="Top Languages" />
        </a>
      </td>
      <td align="center" valign="middle">
        <a href="https://codeforces.com/profile/Gerbunte">
          <img src="https://codeforces-readme-stats.vercel.app/api/card?username=Gerbunte&theme=radical" alt="Codeforces Stats" />
        </a>
      </td>
    </tr>
  </table>
</div>

---

## 🤝 Conexões & Presença

<div align="center">
  <a href="https://gabrielfrigo.dev.br">
    <img src="https://img.shields.io/badge/gabrielfrigo.dev.br-000000?style=for-the-badge&logo=google-chrome&logoColor=white" alt="Website" />
  </a>
  <a href="https://linkedin.com/in/gabriel-frigo-b6727b275">
    <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn" />
  </a>
  <a href="https://github.com/GabrielFrigo4/resumes">
    <img src="https://img.shields.io/badge/Currículos_PDF-gray?style=for-the-badge&logo=github&logoColor=white" alt="Resumes" />
  </a>
  <a href="https://lattes.cnpq.br/1721099873501687">
    <img src="https://img.shields.io/badge/Currículo_Lattes-00599C?style=for-the-badge&logo=google-scholar&logoColor=white" alt="Lattes" />
  </a>
  <a href="https://gamejolt.com/@cacarumbaZ">
    <img src="https://img.shields.io/badge/Game_Jolt-2f7f6f?style=for-the-badge&logo=game-jolt&logoColor=white" alt="Game Jolt" />
  </a>
</div>
