# E aí, eu sou o Gabriel Frigo! 👾

> **Estudante de Ciência da Computação e BC&T na UFABC**<br />
> _Baixa Abstração, Engenharia de Sistemas, Fundamentos de UNIX, Computação Gráfica & Otimização Combinatória_

Troquei as competições de matemática e astronomia (onde conquistei algumas medalhas) para me dedicar ao que realmente me move: resolver problemas de alta densidade algorítmica, codar perto do metal e entender **como as coisas realmente funcionam por baixo dos panos** — do silício ao userspace.

---

## 🧠 Filosofia de Engenharia: A Tríade Canônica

Minha atuação técnica rejeita os dois extremos rasos do desenvolvimento de software: **rejeito a alienação das caixas-pretas de altíssimo nível** (que escondem a mecânica do hardware e do kernel) e **rejeito a burocracia bizantina desnecessária** (como escrever 1.500 linhas de boilerplate manual em Vulkan ou DirectX 12 direto para desenhar uma primitiva).

Busco o **equilíbrio de ouro**: fundamentos sólidos e perenes combinados com uma vanguarda pragmática e explícita.

```mermaid
flowchart TD
    subgraph S1 ["🏛️ 1. Fundamentos & Perto do Metal"]
        UNIX["UNIX / POSIX: (FD + ID)<br/>VFS, Sockets, Nós /dev, ioctl, kqueue/epoll"]
        SEC["Capacidades & Segurança Moderna<br/>Capsicum (FreeBSD) • CHERI / CheriBSD (Hardware)"]
        HW["Hardware & Portas Lógicas<br/>Assembly • VHDL • FPGA"]
        HIST["Computação Gráfica Clássica<br/>GLFW3 • GLAD 1/2 • SDL3 • OpenGL & OpenCL (Histórico)"]
    end

    subgraph S2 ["⚡ 2. Vanguarda Pragmática (O Doce Ponto Moderno)"]
        MOD_GPU["Pipeline Gráfica Moderna sem Burocracia Bizantina<br/>SDL_GPU • WebGPU • QRhi (Mínimo Denominador Comum)"]
        TOOL["Tooling & Ferramental Imediato<br/>Dear ImGui • ALSA • OpenAL"]
        LANG["Linguagens Modernas & Sistemas<br/>C23 • C++23 • Rust • Go • Elisp"]
    end

    subgraph S3 ["🎯 3. Ciência & Rigor Algorítmico"]
        OPT["Otimização Combinatória & Teoria dos Grafos<br/>Pesquisa em Fluxos em Digrafos (UFABC / PIBIC)"]
        CP["Programação Competitiva de Alto Desempenho<br/>ICPC (Final Nacional 2026) • Codeforces (Gerbunte) • OBI"]
    end

    S1 --> S2 --> S3
```

### 1. O Núcleo UNIX: Desmistificando o Sistema via (FD + ID) & Capabilities

Acredito que o domínio de um sistema operacional tipo Unix se resume à compreensão profunda de duas primitivas atemporais:

- **Descritores de Arquivo (FD):** Sockets _são_ descritores de arquivo. Sockets, pipes, FIFOs, arquivos no VFS, dispositivos em `/dev`, multiplexação de eventos (`kqueue`/`epoll`/`poll`) e canais de áudio (ALSA/OSS) operam todos sob a mesma semântica pura de stream e descritor.
- **Identificadores & Credenciais (ID):** O modelo de processos e isolamento (UID, GID, EUID, PID, namespaces e controle de acesso).
- **A Próxima Fronteira das Capacidades:** A evolução desse modelo em direção à segurança por privilégio mínimo:
    - _No nível de software:_ **Capsicum** (FreeBSD), eliminando o namespace global e operando estritamente sobre direitos delegados a FDs.
    - _No nível de hardware e silício:_ **CHERI** e **CheriBSD**, implementando segurança de memória com integridade de ponteiros e limites espaciais/temporais diretamente nas instruções da CPU.
- **Espírito Hacker:** O prazer de construir e entender a base, estendendo-se para **Assembly**, **VHDL** e **FPGA**.

### 2. Computação Gráfica: A GPU Moderna sem Complexidade Bizantina

- **Base Estável:** **GLFW3**, **GLAD (1 e 2)** e **SDL3** como fundações de janela, contexto e I/O.
- **Estudo Histórico e Conceitual:** **OpenGL** e **OpenCL**, preservados e estudados como marcos da transição da pipeline fixa para a programável e do surgimento da computação paralela em GPU.
- **O Ponto Ótimo Contemporâneo:** **SDL_GPU**, **WebGPU** e **QRhi**.
    - Representam exatamente como as placas gráficas funcionam hoje (pipelines imutáveis, command buffers, pass encoders, bind groups e barreiras de memória explícitas).
    - São o _mínimo denominador comum elegante_ entre Vulkan, Metal e DirectX 12 — entregando controle fino de GPU e shaders sem a burocracia bizantina de milhares de linhas de alocação de baixo nível, e anos-luz de distância da alienação de caixas-pretas de brinquedo (SFML, Raylib).
    - **Dear ImGui** para instrumentação, dashboards de engine e depuração em tempo real.

### 3. Ciência, Algoritmos & Maratonas

- **Iniciação Científica (UFABC / PIBIC):** Pesquisa focada em Problemas de Fluxos em Redes (_Network Flows_: Fluxo Máximo e Fluxo de Custo Mínimo), implementações de alta fidelidade em C++23 e testes com benchmarks canônicos da DIMACS.
- **Programação Competitiva:** Membro da equipe GRUB da UFABC. Treinamento intensivo focado na **Final Nacional do ICPC 2026**, Codeforces, Maratona Paulista e OBI.

---

## 🏛️ O Sexteto de Engenharia (Os 6 Hubs Federados)

Meu GitHub é estruturado em torno de **6 ecossistemas federados e soberanos**, cada um atuando como um hub orquestrador independente:

| Repositório Hub                                                                                                                          | Foco & Responsabilidade                                          | Tecnologias Centrais             | Componentes Canônicos                                                            |
| :--------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------- | :------------------------------- | :------------------------------------------------------------------------------- |
| [![Environment](https://img.shields.io/badge/🏛️_Environment-Hub-purple?style=flat-square)](https://github.com/GabrielFrigo4/environment) | Orquestrador de estações de trabalho e dotfiles soberanos        | POSIX Shell, Elisp, Lua, C       | `Setup`, `Shell`, `Vault`, `Profile`, `Emacs`, `Helix`, `NeoVim`, `Vim`          |
| [![Core](https://img.shields.io/badge/⚡_Core-Hub-blue?style=flat-square)](https://github.com/GabrielFrigo4/core)                        | Utilitários de sistema, elevação de privilégios e acervo técnico | C99, POSIX.1, LaTeX, Git         | `Sysutils` (`rtdo`/`rtgo`), `Library` (Acervo CS/Math), `Raw Text`               |
| [![Research](https://img.shields.io/badge/🔬_Research-Hub-teal?style=flat-square)](https://github.com/GabrielFrigo4/research)            | Pesquisa acadêmica em Otimização Combinatória e Grafos           | C++23, LaTeX, DIMACS             | `Network Flow` (Fluxo Máximo e Custo Mínimo, Livro & Relatórios)                 |
| [![Training](https://img.shields.io/badge/🎯_Training-Hub-red?style=flat-square)](https://github.com/GabrielFrigo4/training)             | Hub de maratonas algorítmicas e programação competitiva          | C++23, Rust, Python, Bash        | `Algorithms` (Templates, CLI `cpt`, Handbook), `Marathon` (ICPC Nacional 2026)   |
| [![Personal](https://img.shields.io/badge/🚀_Personal-Hub-green?style=flat-square)](https://github.com/GabrielFrigo4/personal)           | Engines de jogos, protocolos, servidores e laboratórios          | C/C++, Rust, SDL3, Lisp, Sockets | `Engines` (`RNG Engine`), `Systems` (`Posix Socket`, `SBL`, `BSD Emacs`), `Labs` |
| [![Venture](https://img.shields.io/badge/💼_Venture-Hub-orange?style=flat-square)](https://github.com/GabrielFrigo4/venture)             | Soluções de mercado, logística operacional e produtos            | Go, Google OR-Tools, PocketBase  | `OptiLaser` (Motor de Otimização Logística VRPTW & Copiloto)                     |

---

## 🛠️ Stack Tecnológico & Domínios

### Sistemas & Perto do Metal

![C](https://img.shields.io/badge/C-C99_%2F_C23-00599C?logo=c&logoColor=white)
![C++](https://img.shields.io/badge/C++-C++20_%2F_C++23-00599C?logo=cplusplus&logoColor=white)
![POSIX](https://img.shields.io/badge/Standards-POSIX.1-black?logo=linux&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Kernel_%26_VFS-blue?logo=linux&logoColor=white)
![FreeBSD](https://img.shields.io/badge/FreeBSD-Capsicum_%26_kqueue-red?logo=freebsd&logoColor=white)
![CheriBSD](https://img.shields.io/badge/CheriBSD-Hardware_Capabilities-darkred)
![Assembly](https://img.shields.io/badge/Assembly-x86__64-yellow)
![Hardware](https://img.shields.io/badge/Hardware-VHDL_%2F_FPGA-teal)

### Computação Gráfica, GPU & I/O

![SDL3](https://img.shields.io/badge/I%2FO-SDL3-lightgrey?logo=libsdl&logoColor=white)
![SDL_GPU](https://img.shields.io/badge/GPU-SDL__GPU-blue)
![WebGPU](https://img.shields.io/badge/GPU-WebGPU-orange?logo=w3c&logoColor=white)
![QRhi](https://img.shields.io/badge/GPU-QRhi-green?logo=qt&logoColor=white)
![GLFW](https://img.shields.io/badge/Context-GLFW3-black)
![GLAD](https://img.shields.io/badge/Loader-GLAD_1_%26_2-gray)
![OpenGL](https://img.shields.io/badge/Historical-OpenGL-5586A4?logo=opengl&logoColor=white)
![OpenCL](https://img.shields.io/badge/Historical-OpenCL-blue?logo=opencl&logoColor=white)
![Dear ImGui](https://img.shields.io/badge/Tooling-Dear_ImGui-red)
![Audio](https://img.shields.io/badge/Audio-ALSA_%2F_OpenAL-purple)

### Linguagens de Aplicação & Runtimes

![Rust](https://img.shields.io/badge/Rust-Tokio_%26_Axum-DEA584?logo=rust&logoColor=white)
![Go](https://img.shields.io/badge/Go-Backend_%26_OR--Tools-00ADD8?logo=go&logoColor=white)
![Python](https://img.shields.io/badge/Python-Scripting_%26_CP-3776AB?logo=python&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-Embedded-2C2D72?logo=lua&logoColor=white)
![Common Lisp](https://img.shields.io/badge/Lisp-Symbolic_Computing-purple?logo=lisp&logoColor=white)
![Emacs Lisp](https://img.shields.io/badge/Elisp-Editor_Runtime-indigo?logo=gnuemacs&logoColor=white)

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
  <a href="https://github.com/GabrielFrigo4/Resumes">
    <img src="https://img.shields.io/badge/Currículos_PDF-gray?style=for-the-badge&logo=github&logoColor=white" alt="Resumes" />
  </a>
  <a href="https://lattes.cnpq.br/1721099873501687">
    <img src="https://img.shields.io/badge/Currículo_Lattes-00599C?style=for-the-badge&logo=google-scholar&logoColor=white" alt="Lattes" />
  </a>
  <a href="https://gamejolt.com/@cacarumbaZ">
    <img src="https://img.shields.io/badge/Game_Jolt-2f7f6f?style=for-the-badge&logo=game-jolt&logoColor=white" alt="Game Jolt" />
  </a>
</div>
