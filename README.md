# E aí, eu sou o Gabriel Frigo! 👾

> **Estudante de Ciência da Computação e BC&T na UFABC**<br />
> _Baixa Abstração, Engenharia de Sistemas, Fundamentos de UNIX, Computação Gráfica & Otimização Combinatória_

Seja muito bem-vindo ao meu cantinho no GitHub! Troquei as competições pesadas de matemática e astronomia (onde conquistei algumas medalhas e muita disciplina mental) para me dedicar de corpo e alma ao que realmente faz meu olho brilhar: **entender a computação de ponta a ponta, do silício aos bits que cruzam o kernel até a tela.**

Eu vejo este perfil como a **BIOS do meu ecossistema**: o lugar onde mostro não apenas o código que escrevo, mas o que me apaixona, como penso arquitetura e a diversão pura de construir coisas rápidas, resilientes e elegantes perto do metal.

---

## 🏛️ Meu Laboratório: O Sexteto de Engenharia (Os 6 Hubs)

Para não transformar meu GitHub em uma gaveta bagunçada de códigos soltos, estruturei todo o meu trabalho em torno de **6 ecossistemas federados e soberanos**. Cada um deles resolve uma frente do meu universo de desenvolvimento:

| Hub                                                               | O que acontece por lá?                                                 | Tecnologias Centrais             | Componentes Canônicos                               |
| :---------------------------------------------------------------- | :--------------------------------------------------------------------- | :------------------------------- | :-------------------------------------------------- |
| [**`environment`**](https://github.com/GabrielFrigo4/environment) | Minha estação de trabalho portátil, dotfiles e automações de SO        | POSIX Shell, Elisp, Lua, C       | `Setup`, `Shell`, `Vault`, `Profile`, `Editores`    |
| [**`foundation`**](https://github.com/GabrielFrigo4/foundation)   | Utilitários de sistema, ferramentas de privilégio e acervo canônico    | C99, POSIX.1, LaTeX, Git         | `Sysutils` (`rtdo`/`rtgo`), `Library`, `Raw Text`   |
| [**`research`**](https://github.com/GabrielFrigo4/research)       | Pesquisa acadêmica em Otimização Combinatória e Grafos na UFABC        | C++23, LaTeX, DIMACS             | `Network Flow` (Fluxo Máximo e Custo Mínimo, Livro) |
| [**`training`**](https://github.com/GabrielFrigo4/training)       | Maratonas algorítmicas, desafios extremos e treino competitivo         | C++23, Rust, Python, Bash        | `Algorithms` (Templates, CLI `cpt`), `Marathon`     |
| [**`personal`**](https://github.com/GabrielFrigo4/personal)       | Engines do zero, computação gráfica, servidores de rede e experimentos | C/C++, Rust, SDL3, Lisp, Sockets | `Engines`, `Systems`, `Labs`, `Identity`, `OSS`     |
| [**`venture`**](https://github.com/GabrielFrigo4/venture)         | Soluções de mercado, logística operacional e produtos completos        | Go, Google OR-Tools, PocketBase  | `OptiLaser` (Motor VRPTW & Copiloto)                |

---

## 🧠 Como eu penso Engenharia: A Tríade Canônica

Fujo deliberadamente de dois extremos que considero armadilhas no desenvolvimento:

1. **A alienação das caixas-pretas de altíssimo nível:** Aquela sensação desconfortável de rodar 50 camadas de abstração sem fazer a menor ideia de quanta memória está sendo queimada, de quantos ponteiros estão vazando ou do que o sistema operacional está sofrendo por baixo.
2. **A burocracia bizantina do masoquismo técnico:** Passar três semanas escrevendo 1.500 linhas de boilerplate manual em Vulkan ou DirectX 12 cru só para conseguir a façanha de desenhar um único triângulo na tela.

O que eu busco todos os dias é o **equilíbrio de ouro**: a força inabalável dos fundamentos clássicos aliada à vanguarda pragmática da indústria moderna.

```mermaid
flowchart TD
    subgraph S1 ["🏛️ 1. Fundamentos & Perto do Metal"]
        direction LR
        UNIX["UNIX / POSIX / BSD<br/>FreeBSD • OpenBSD • Linux • PF<br/>VFS • Sockets • /dev • ioctl • kqueue"]
        SEC["Capacidades & Segurança<br/>Capsicum • Pledge • Unveil • CHERI"]
        HW["Hardware & Silício<br/>Assembly • VHDL • FPGA"]
        HIST["Padrões Clássicos<br/>OpenGL • OpenCL • OpenAL"]
        UNIX ~~~ SEC ~~~ HW ~~~ HIST
    end

    subgraph S2 ["⚡ 2. Vanguarda Pragmática & Ergonomia"]
        direction LR
        SDL_PHIL["Filosofia SDL & POSIX<br/>Mínimo Denominador da Indústria<br/>Estabilidade sem Hype Efêmero"]
        MOD_GPU["GPU & Áudio<br/>SDL_GPU • WebGPU • QRhi<br/>OSS • ALSA • SDL_Audio"]
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

---

## 💡 O que realmente faz meu olho brilhar

### 1. A Poesia do UNIX: Quando tudo é um Descritor e uma Credencial (FD + ID)

Sabe aquele estalo mental inesquecível em que a arquitetura inteira de computação se ilumina na sua frente? Para mim, foi perceber que quase toda a mágica dos sistemas Unix-like (FreeBSD, Linux, OpenBSD) se apoia em apenas duas primitivas absurdamente simples e geniais:

- **File Descriptors (FD):** Onde e como você conversa com o fluxo de dados. Sockets de rede? São FDs. Arquivos no disco, pipes entre processos, nós de dispositivos em `/dev`, multiplexação de eventos em alta escala com `kqueue`/`epoll` e o próprio subsistema de som. Quando o sistema operacional é bem desenhado, **tudo pode e deve ser tratado como um descritor de arquivo**.
    - _O momento em que eu pirei com isso:_ No **OSS (Open Sound System)** do FreeBSD, se você quiser testar o microfone saindo nas caixas, você simplesmente roda no terminal:
        ```sh
        cat /dev/dsp > /dev/dsp
        ```
        E pronto! Sua voz sai nos alto-falantes em tempo real. Sem servidor de áudio mastodôntico consumindo CPU, sem dezenas de camadas intermediárias. É áudio tratado como um stream puro de bytes no VFS. Isso para mim é o ápice da elegância computacional!
- **Identifiers & Credenciais (ID):** Quem é o sujeito executando a ação (UID, GID, EUID, PID) e onde ficam as fronteiras de autorização.

Quando você junta **FD** e **ID**, nasce a verdadeira engenharia defensiva que eu amo praticar:

- **Privilege Separation (PrivSep):** O padrão magistral do OpenBSD (consagrado no OpenSSH). O processo mestre faz `fork()`, passa apenas os descritores estritamente necessários via sockets UNIX (`sendmsg`/`SCM_RIGHTS`) e o processo filho derruba privilégios trocando de ID e trancando a própria porta com `pledge(2)` e `unveil(2)`. Se o filho for comprometido, ele simplesmente não tem para onde correr.
- **A Próxima Fronteira (Capabilities):** Unificar o descritor e a autorização em um único objeto inseparável — seja via software com o **Capsicum** no FreeBSD, seja a nível de registradores de hardware e silício com a arquitetura **CHERI / CheriBSD**.

---

### 2. A Simetria entre POSIX e SDL: Criando do Zero sem Reinventar a Roda

Existe uma harmonia linda entre o padrão **POSIX** e a biblioteca **SDL (Simple DirectMedia Layer)**:

- Nenhum dos dois dá a mínima para os hypes passageiros que morrem no ano seguinte.
- Ambos funcionam como o **mínimo denominador comum** universal que permite que monitores, placas de som, teclados e drivers conversem a mesmíssima língua em qualquer plataforma.
- Adoro criar minhas próprias engines de jogos e ferramentas interativas usando **SDL3**. Com as novidades do **SDL_GPU**, **WebGPU** e **QRhi**, consigo modelar a arquitetura real das placas de vídeo modernas (pipelines imutáveis, command buffers e barreiras explícitas de memória) com clareza cristalina, fugindo das 1.500 linhas de dor do Vulkan cru e longe de engines "caixa-preta" prontas que tiram toda a graça do aprendizado.

---

### 3. Sistemas, Arquitetura & O Monólito Sem Preconceito

Frameworks vêm e vão a cada seis meses, mas boas decisões de dados e arquitetura duram décadas:

- **O Poder Titânico do SQLite em modo WAL:** Tenho uma admiração profunda pela engenharia do SQLite. Quando configurado com _Write-Ahead Logging_ (WAL) e transações otimizadas, ele entrega latência de nanossegundos em memória/VFS, integridade ACID impecável em um único arquivo, zero sobrecarga de rede e zero demônios em segundo plano. Para serviços locais, monólitos coesos e ferramentas autônomas, sua eficiência é imbatível.
- **A Tríade Relacional em Escala:** Obviamente, nem tudo se resolve com banco embutido. Quando o projeto pede concorrência massiva multi-writer, particionamento declarativo, índices geoespaciais com PostGIS ou JSONB turbinado com índices GIN, o **PostgreSQL** é meu parceiro de guerra absoluto. Paralelamente, **MySQL** e **MariaDB** formam a muralha veterana e hiper-testada para grandes volumes de leitura.
- **Gestão & Modelagem Visual com DBeaver:** Para transitar entre esses diferentes motores, explorar esquemas, analisar planos de execução (`EXPLAIN`) e debugar queries com precisão sem fricção entre bancos locais e remotos, o **DBeaver** é meu canivete suíço visual indispensável.
- **PocketBase + Go + Let's Encrypt:** O exemplo prático do que eu amo em engenharia: simplicidade extrema. Um único binário compilado em Go, com SQLite WAL embutido e emissão nativa de certificados SSL sem precisar quebrar a cabeça configurando proxies reversos monstruosos. Se o sistema não atende o planeta inteiro de uma vez, não há motivo para pagar a conta de sanidade mental de 50 microsserviços.
- **O Frontend sem Inchaço com o Compilador do Svelte ([svelte.dev](https://svelte.dev/)):** A mesma intolerância ao inchaço que tenho no terminal eu levo para a web. Rejeito as centenas de megabytes de dependências e a sobrecarga de Virtual DOMs gigantescos. O **Svelte** e o **SvelteKit** encaram o frontend como um **compilador**: transformam seus componentes em JavaScript reativo e cirúrgico em tempo de build. É leve, é direto ao ponto e entrega bundles minúsculos.

---

### 4. Ciência, Grafos & O Ritmo Alucinante das Maratonas

Minha formação acadêmica e meu tempo livre convergem para a densidade algorítmica:

- **Iniciação Científica (UFABC / PIBIC):** Pesquiso Problemas de Fluxos em Redes (_Network Flows_: Fluxo Máximo e Fluxo de Custo Mínimo), implementando e refinando algoritmos em C++23 e validando com instâncias canônicas da DIMACS.
- **Programação Competitiva:** Membro ativo da equipe **GRUB da UFABC**. Treinamento intensivo mirando a **Final Nacional do ICPC 2026**, Codeforces, Maratona Paulista e OBI. A sensação de resolver um problema complexo sob pressão de tempo com complexidade assintótica ótima é uma adrenalina única!

---

## ⚡ Minhas Ferramentas de Batalha: Ergonomia Hacker & IA Socrática

### Editores Modais & Teclado Puro

Navegação em texto puro, sem tirar as mãos da fileira central e com resposta instantânea:

- **Helix:** Meu editor modal moderno favorito. Filosofia `selection -> action`, tree-sitter nativo e LSP funcionando liso sem precisar instalar 40 plugins.
- **Vim & Neovim:** O clássico eterno e seu ecossistema moderno em Lua para quando quero extensibilidade total.
- **GNU Emacs:** Não é só um editor, é um ambiente Lisp vivo. Estruturado com gerenciador transacional **Elpaca**, LSP nativo via **Eglot**, **Org Mode** para organizar a vida e ciclo de vida conectado via daemon com socket Unix.
- **VS Code / Code-OSS:** Para quando uma inspeção gráfica ou depuração visual acelera o trabalho pontual.

### Shells & Soberania Multi-OS

Trânsito livre e confortável entre qualquer ambiente:

- **UNIX / POSIX:** **Zsh** como shell interativo de alta produtividade; **Bash** e o ultrarrápido **FreeBSD `/bin/sh`** para automação estrita e portabilidade universal; **OpenBSD `/bin/ksh`** quando o foco é pureza e segurança.
- **Windows Turbinado:** **PowerShell** para automação com objetos; **Nushell** para pipelines com tabelas estruturadas; e o bom e velho **CMD com Clink**, que injeta **GNU Readline** e scripts Lua com keybindings Vi diretamente no prompt do Windows!

### Inspeção Cirúrgica: Redes & Protocolos

Quando a teoria acaba e o que vale é o dado bruto trafegando no meio físico:

- **Wireshark:** Meu microscópio essencial para quando preciso ver a verdade nua e crua passando pelo fio. Nada de suposições sobre a camada de rede e transporte: dissecar frames Ethernet, handshakes TCP, fluxos UDP e payloads binários com filtros de captura cirúrgicos (`display filters`) para encontrar o que está realmente acontecendo no tráfego.

### Inteligência Artificial Socrática & A Primazia do Compilador Determinístico

Uso inteligência artificial diariamente em fluxos agênticos avançados com o ecossistema **Google Antigravity** (CLI `agy`, IDE, 2.0 e SDK Python), mas sigo dois princípios que nunca abro mão:

> **1. O Método Socrático com IA (Perguntar sempre, desafiar tudo):**
> Jamais trato respostas de modelos como verdades absolutas. Perto do metal, **99% de certeza não basta** — o 1% restante é onde moram vazamentos de memória, condições de corrida e comportamentos indefinidos (UB). A IA é fantástica quando usada como contraparte dialética: para bater ideias, apontar cantos obscuros e questionar decisões.

> **2. Compiladores Determinísticos > Alucinações Probabilísticas:**
> Prefiro mil vezes o rigor intransigente de um **compilador determinístico** do que suposições estatísticas. É exatamente por isso que tenho um caso de amor com linguagens de tipagem estrita como **Rust, Zig, C, C++ e Go** (e o compilador do **Svelte** na web): o compilador não acorda de mau humor, não alucina e não aceita atalhos. Se o compilador validou e gerou o binário, temos garantias matemáticas concretas de execução.

---

## 🛠️ Stack Tecnológico & Domínios

### Sistemas Operacionais & Ambientes

![FreeBSD](https://img.shields.io/badge/FreeBSD-Primary_Workstation-red?logo=freebsd&logoColor=white)
![OpenBSD](https://img.shields.io/badge/OpenBSD-Security_%26_Purity-yellow?logo=openbsd&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Servers_%26_Cloud-blue?logo=linux&logoColor=white)
![illumos](https://img.shields.io/badge/illumos-Zones_%26_DTrace-orange?logo=openzfs&logoColor=white)
![Windows](<https://img.shields.io/badge/Windows_(MSYS2)-Tooling_%26_Clink-purple?logo=gitforwindows&logoColor=white>)
![CheriBSD](https://img.shields.io/badge/CheriBSD-Capabilities_Research-darkred?logo=freebsd&logoColor=white)

### Infraestrutura, Redes & Perto do Metal

![Packet Filter](<https://img.shields.io/badge/PF-Packet_Filter_(BSD)-1b4332?logo=openbsd&logoColor=white>)
![Wireshark](https://img.shields.io/badge/Network-Wireshark-1679A7?logo=wireshark&logoColor=white)
![Sylve](https://img.shields.io/badge/Sylve-bhyve_%26_Jails-blue?logo=freebsd&logoColor=white)
![OpenZFS](https://img.shields.io/badge/Storage-OpenZFS-black?logo=openzfs&logoColor=white)
![POSIX](https://img.shields.io/badge/Standard-POSIX.1-black?logo=ieee&logoColor=white)
![Hardware](https://img.shields.io/badge/Sil%C3%ADcio-Assembly_%2F_VHDL_%2F_FPGA-teal?logo=riscv&logoColor=white)

### Conteinerização, Sandboxing & Virtualização

![Podman](https://img.shields.io/badge/Podman-Linux_%26_FreeBSD-892CA0?logo=podman&logoColor=white)
![Docker](https://img.shields.io/badge/OCI-Docker-2496ED?logo=docker&logoColor=white)
![Incus / LXC](https://img.shields.io/badge/System_Containers-Incus_%26_LXC-informational?logo=linuxcontainers&logoColor=white)
![Jails & Bastille](https://img.shields.io/badge/Jails-BastilleBSD-red?logo=freebsd&logoColor=white)
![Zones](https://img.shields.io/badge/Zones-Solaris_%26_illumos-orange?logo=openzfs&logoColor=white)

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

### Bancos de Dados Relacionais & Otimizadores

![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-4169E1?logo=postgresql&logoColor=white)
![MySQL](https://img.shields.io/badge/Database-MySQL-4479A1?logo=mysql&logoColor=white)
![MariaDB](https://img.shields.io/badge/Database-MariaDB-003545?logo=mariadb&logoColor=white)
![SQLite](https://img.shields.io/badge/Database-SQLite-003B57?logo=sqlite&logoColor=white)
![DBeaver](https://img.shields.io/badge/GUI-DBeaver-372923?logo=dbeaver&logoColor=white)
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

## 🤝 Bora trocar uma ideia?

Sempre topo conversar sobre engenharia de sistemas, maratonas algorítmicas, desenvolvimento de engines ou sobre projetos de ensino e extensão universitária. Sinta-se em casa para me dar um toque!

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
