# E aí, eu sou o Gabriel Frigo! 👾

> **Estudante de Ciência da Computação e BC&T na UFABC**<br />
> _Baixa Abstração, Engenharia de Sistemas, Fundamentos de UNIX, Computação Gráfica & Otimização Combinatória_

Troquei as competições de matemática e astronomia (onde conquistei algumas medalhas) para me dedicar ao que realmente me move: resolver problemas de alta densidade algorítmica, codar perto do metal e entender **como as coisas realmente funcionam por baixo dos panos** — do silício ao userspace.

---

## 🧠 Filosofia de Engenharia: A Tríade Canônica

Minha atuação técnica rejeita os dois extremos rasos do desenvolvimento de software: **rejeito a alienação das caixas-pretas de altíssimo nível** (que ocultam a mecânica do hardware e do kernel) e **rejeito a burocracia bizantina desnecessária** (como escrever 1.500 linhas de boilerplate manual em Vulkan ou DirectX 12 direto para desenhar uma primitiva).

Busco o **equilíbrio de ouro**: fundamentos sólidos e perenes combinados com uma vanguarda pragmática, sem inchaço operacional.

```mermaid
flowchart TD
    subgraph S1 ["🏛️ 1. Fundamentos & Perto do Metal"]
        direction LR
        UNIX["UNIX / POSIX: FD + ID<br/>VFS • Sockets • /dev • ioctl • kqueue"]
        SEC["Capacidades & Segurança<br/>Capsicum • CHERI • CheriBSD"]
        HW["Hardware & Silício<br/>Assembly • VHDL • FPGA"]
        HIST["Padrões Clássicos & Históricos<br/>OpenGL • OpenCL • OpenAL"]
        UNIX ~~~ SEC ~~~ HW ~~~ HIST
    end

    subgraph S2 ["⚡ 2. Vanguarda Pragmática & Mínimo Denominador"]
        direction LR
        SDL_PHIL["Filosofia SDL & POSIX<br/>Mínimo Denominador da Indústria<br/>Estabilidade sem Hype Efêmero"]
        MOD_GPU["GPU & Áudio Nativo<br/>SDL_GPU • WebGPU • QRhi<br/>OSS • ALSA • SDL_Audio"]
        SYS_PRAG["Sistemas & Anti-Inchaço<br/>C23 • C++23 • Rust • Go • Zig • C# • Scala<br/>SQLite • PocketBase • Let's Encrypt • OR-Tools"]
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

### 1. O Núcleo UNIX: (FD + ID) & Capabilities no Software e Silício

Acredito que o domínio de um sistema operacional tipo Unix se resume à compreensão profunda de duas primitivas atemporais:

- **Descritores de Arquivo (FD):** Sockets _são_ descritores de arquivo. Sockets, pipes, FIFOs, arquivos no VFS, dispositivos em `/dev`, multiplexação de eventos (`kqueue`/`epoll`) e o subsistema de áudio nativo operam sob a mesma semântica pura de stream e descritor.
- **Identificadores & Credenciais (ID):** O modelo de processos e isolamento (UID, GID, EUID, PID, namespaces e controle de acesso).
- **A Próxima Fronteira das Capacidades:** A evolução desse modelo em direção à segurança por privilégio mínimo:
    - _No nível de software:_ **Capsicum** (FreeBSD), eliminando o namespace global e operando estritamente sobre direitos delegados a FDs.
    - _No nível de hardware e silício:_ **CHERI** e **CheriBSD**, implementando segurança de memória com integridade de ponteiros e limites espaciais/temporais diretamente nas instruções da CPU.
- **Espírito Hacker & Hardware:** Curiosidade de entender a máquina do silício ao binário com **Assembly**, **VHDL** e **FPGA**.

### 2. A Filosofia SDL & POSIX: O Mínimo Denominador Comum

Existe uma profunda simetria entre o **POSIX** e a **SDL (Simple DirectMedia Layer)**:

- Ambos se recusam a perseguir hypes passageiros ou reinventar a roda a cada ciclo da moda.
- Ambos operam como o **mínimo denominador comum** universal que permite a plataformas, drivers, displays e placas de som conversarem exatamente a mesma língua.
- Não são tecnologias defasadas: são **maduras, ultra-estáveis e impecáveis no que se propõem a fazer**.
- **A GPU Moderna sem Fricção Bizantina:** Adoção de **SDL_GPU**, **WebGPU** e **QRhi** — modelam a arquitetura real das placas modernas (pipelines imutáveis, command buffers, bind groups e barreiras explícitas) sem a burocracia de milhares de linhas de código bare-metal, e longe de caixas-pretas alienantes (SFML, Raylib).
- **Áudio Nativo no Sistema Operacional:**
    - **OSS (Open Sound System):** O padrão nativo elegante e direto do FreeBSD (`/dev/dsp`, ioctl, unix stream puro, zero sound servers intermediários).
    - **ALSA (Advanced Linux Sound Architecture):** A interface nativa de baixo nível do kernel Linux.
    - **SDL Audio:** A camada unificada e consistente do SDL3.
    - **OpenGL**, **OpenCL** e **OpenAL**: Preservados e estudados como marcos clássicos formativos da computação gráfica, GPGPU e áudio 3D.

### 3. Sistemas, Arquitetura & Filosofia Anti-Complexidade

Frameworks são passageiros; filosofias arquiteturais e linguagens robustas permanecem:

- **SQLite (WAL Mode):** O padrão definitivo de banco embutido. Zero latência de rede, zero administração de daemon, integridade ACID estrita em arquivo único no VFS.
- **PocketBase & Let's Encrypt:** Adoção pela filosofia de simplicidade e baixo atrito operacional. Go puro, SQLite WAL integrado e provisionamento automático de certificados SSL/TLS via **Let's Encrypt** nativo (sem a necessidade burocrática de proxies reversos complexos como Nginx ou Traefik em deploys autônomos). Se um serviço não exige escala planetária distribuída, não há sentido em pagar o custo cognitivo de 50 microsserviços e PostgreSQL. Cada contexto dita sua solução ideal.
- **Infraestrutura Soberana:** Uso do **FreeBSD** como sistema principal em workstation/notebook e em servidores, explorando orquestração moderna com **Sylve** (virtualização bhyve e Jails sobre ZFS), complementado por nós de computação Linux e estações Windows (MSYS2).

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

### Sistemas Operacionais, Infra & Perto do Metal

![FreeBSD](https://img.shields.io/badge/FreeBSD-Primary_OS_%26_Capsicum-red?logo=freebsd&logoColor=white)
![Sylve](https://img.shields.io/badge/Sylve-Jails_%26_bhyve-blue)
![OpenZFS](https://img.shields.io/badge/Storage-OpenZFS-black?logo=openzfs&logoColor=white)
![CheriBSD](https://img.shields.io/badge/CheriBSD-Hardware_Capabilities-darkred)
![POSIX](https://img.shields.io/badge/Standards-POSIX.1-black?logo=linux&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Servers_%26_Kernel-blue?logo=linux&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-MSYS2-purple?logo=gitforwindows&logoColor=white)
![Hardware](https://img.shields.io/badge/Hardware-Assembly_%2F_VHDL_%2F_FPGA-teal)

### Linguagens de Programação

![C](https://img.shields.io/badge/C-C99_%2F_C23-00599C?logo=c&logoColor=white)
![C++](https://img.shields.io/badge/C++-C++20_%2F_C++23-00599C?logo=cplusplus&logoColor=white)
![Rust](https://img.shields.io/badge/Rust-Systems_%26_Async-DEA584?logo=rust&logoColor=white)
![Go](https://img.shields.io/badge/Go-Backend_%26_Concurrency-00ADD8?logo=go&logoColor=white)
![Zig](https://img.shields.io/badge/Zig-Toolchain_%26_Systems-F7A41D?logo=zig&logoColor=white)
![C#](https://img.shields.io/badge/C%23-DotNet-512BD4?logo=csharp&logoColor=white)
![Scala](https://img.shields.io/badge/Scala-Functional-DC322F?logo=scala&logoColor=white)
![Python](https://img.shields.io/badge/Python-Scripting_%26_CP-3776AB?logo=python&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-Embedded-2C2D72?logo=lua&logoColor=white)
![Lisp](https://img.shields.io/badge/Lisp-Common_Lisp_%26_Elisp-purple?logo=lisp&logoColor=white)

### Computação Gráfica, GPU & Áudio

![SDL3](https://img.shields.io/badge/Runtime-SDL3-informational?logo=libsdl&logoColor=white)
![SDL_GPU](https://img.shields.io/badge/GPU-SDL__GPU-blue?logo=libsdl&logoColor=white)
![SDL_Audio](https://img.shields.io/badge/Audio-SDL__Audio-blue?logo=libsdl&logoColor=white)
![WebGPU](https://img.shields.io/badge/GPU-WebGPU-orange?logo=w3c&logoColor=white)
![QRhi](https://img.shields.io/badge/GPU-QRhi-green?logo=qt&logoColor=white)
![OSS](https://img.shields.io/badge/Audio-OSS-purple?logo=freebsd&logoColor=white)
![ALSA](https://img.shields.io/badge/Audio-ALSA-blue?logo=linux&logoColor=white)
![ImGui](https://img.shields.io/badge/Tooling-Dear_ImGui-red)
![GLFW](https://img.shields.io/badge/Context-GLFW3-black)
![GLAD](https://img.shields.io/badge/Loader-GLAD_1_%26_2-gray)
![OpenGL](https://img.shields.io/badge/Historical-OpenGL-5586A4?logo=opengl&logoColor=white)
![OpenCL](https://img.shields.io/badge/Historical-OpenCL-blue?logo=opencl&logoColor=white)
![OpenAL](https://img.shields.io/badge/Historical-OpenAL-darkblue)

### Filosofia Arquitetural & Motores de Decisão

![SQLite](https://img.shields.io/badge/Database-SQLite-003B57?logo=sqlite&logoColor=white)
![PocketBase](https://img.shields.io/badge/Backend-PocketBase-B8DBE8?logo=pocketbase&logoColor=white)
![Let's Encrypt](https://img.shields.io/badge/Security-Let's_Encrypt-003A70?logo=letsencrypt&logoColor=white)
![OR-Tools](https://img.shields.io/badge/Solvers-Google_OR--Tools-4285F4?logo=google&logoColor=white)

### Editores & Ambientes de Desenvolvimento

![Helix](https://img.shields.io/badge/Helix-Modal_Editor-2B2937?logo=helix&logoColor=white)
![GNU Emacs](https://img.shields.io/badge/GNU_Emacs-Elpaca_%26_Eglot-7F5AB6?logo=gnuemacs&logoColor=white)
![Neovim](https://img.shields.io/badge/Neovim-Lua_%26_Treesitter-57A143?logo=neovim&logoColor=white)
![Vim](https://img.shields.io/badge/Vim-Modal_Classic-019733?logo=vim&logoColor=white)
![VS Code](https://img.shields.io/badge/VS_Code-Code--OSS-007ACC?logo=visualstudiocode&logoColor=white)

### Shells & Runtimes de Terminal

![Zsh](https://img.shields.io/badge/Zsh-Interactive_Power-blue?logo=zsh&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-Universal_POSIX-green?logo=gnubash&logoColor=white)
![FreeBSD sh](https://img.shields.io/badge/FreeBSD_sh-Pure_POSIX-red?logo=freebsd&logoColor=white)
![OpenBSD ksh](https://img.shields.io/badge/OpenBSD_ksh-Minimal_Korn-yellow?logo=openbsd&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-pwsh-5391FE?logo=powershell&logoColor=white)
![Nushell](https://img.shields.io/badge/Nushell-Structured_Data-4E9A06?logo=nushell&logoColor=white)
![CMD + Clink](https://img.shields.io/badge/CMD-Clink_%26_Lua-4A5568?logo=lua&logoColor=white)

### Plataformas de IA & Engenharia de Contexto

![Antigravity](https://img.shields.io/badge/Google_Antigravity-CLI_%26_IDE_%26_2.0-4285F4?logo=google&logoColor=white)
![Antigravity SDK](https://img.shields.io/badge/Antigravity-Python_SDK-3776AB?logo=python&logoColor=white)
![AI Skills](https://img.shields.io/badge/AI_Governance-Skills_%26_AGENTS.md-teal)
![Socratic Inquiry](https://img.shields.io/badge/Epistemologia-Método_Socrático-purple)

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
