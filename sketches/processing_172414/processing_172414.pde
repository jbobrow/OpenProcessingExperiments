
final int DIM = 10;
final int DIM2 = 10;
//static final char QUADRINHO = char(0x9633);
static final String QUADRINHO = str('□');
PosicaoMemoria mem[] = new PosicaoMemoria[DIM2*DIM];
RegistradorAX regAX;
RegistradorAL regAL;
Registrador regIP;
Registrador regSP;
Flags regFLAGS;
Botao bReset;
Botao bPasso;
Botao bExec;
Entrada nomeArq;
Botao bCarrega;
Botao bSalva;
boolean executando = false;

String mnemonic(PosicaoMemoria pm) {
  int opcode = pm.valor; 
  int dado = 0xff & pm.prox.valor;
  switch (opcode) {
  case 0x02:
    return "ADD AL,["+dado+"]";
  case 0x03:
    return "ADD AX,["+dado+"]";
  case 0x04:
    return "ADD AL,"+dado;
  case 0x05:
    return "ADD AX,"+(dado+((0xff & pm.prox.prox.valor) << 8));

  case 0x2a:
    return "SUB AL,["+dado+"]";
  case 0x2b:
    return "SUB AX,["+dado+"]";
  case 0x2c:
    return "SUB AL,"+dado;
  case 0x2d:
    return "SUB AX,"+(dado+((0xff & pm.prox.prox.valor) << 8));

  case 0x3a:
    return "CMP AL,["+dado+"]";
  case 0x3b:
    return "CMP AX,["+dado+"]";
  case 0x3c:
    return "CMP AL,"+dado;
  case 0x3d:
    return "CMP AX,"+(dado+((0xff & pm.prox.prox.valor) << 8));

  case 0x72:
    return "JC "+dado;
  case 0x73:
    return "JNC "+dado;
  case 0x74:
    return "JZ "+dado;
  case 0x75:
    return "JNZ "+dado;
  case 0x76:
    return "JBE "+dado;
  case 0x77:
    return "JA "+dado;
  case 0x78:
    return "JS "+dado;
  case 0x79:
    return "JNS "+dado;

  case 0xa2:
    return "MOV ["+dado+"],AL";
  case 0xa3:
    return "MOV ["+dado+"],AX";
  case 0xa0:
    return "MOV AL,["+dado+"]";
  case 0xa1:
    return "MOV AX,["+dado+"]";
  case 0xb0:
    return "MOV AL,"+dado;
  case 0xb8:
    return "MOV AX,"+(dado+((0xff & pm.prox.prox.valor) << 8));

  case 0xeb:
    return "JMP "+dado;
    
  case 0xe8:
    return "CALL "+dado;
  case 0xc3:
    return "RET";
    
  case 0xf4:
    return "HLT";
  }
  return "???";
}

int ADD8(int op1, int op2) {
  int resul = op1 + op2;
  regFLAGS.atrib8(resul);
  return resul & 0xff;
}

int ADD16(int op1, int op2) {
  int resul = op1 + op2;
  regFLAGS.atrib16(resul);
  return resul & 0xffff;
}

int SUB8(int op1, int op2) {
  int resul = op1 - op2;
  regFLAGS.atrib8(resul);
  return resul & 0xff;
}

int SUB16(int op1, int op2) {
  int resul = op1 - op2;
  regFLAGS.atrib16(resul);
  return resul & 0xffff;
}

void executa() {
  int opcode = mem[regIP.valor].valor;
  int dado = mem[regIP.valor+1].valor;
  int resul;
  switch (opcode) {

  case 0x02://ADD AL,[ ]
    regAL.atribui(ADD8(regAL.valor, mem[dado].valor));
    regIP.atribui(regIP.valor + 2);
    break;
  case 0x03://ADD AX,[ ]
    regAX.atribui(ADD16(regAX.valor, mem[dado].valor + (mem[dado+1].valor << 8)));
    regIP.atribui(regIP.valor + 2);
    break;
  case 0x04://ADD AL,im8
    regAL.atribui(ADD8(regAL.valor, dado));
    regIP.atribui(regIP.valor + 2);
    break;
  case 0x05://ADD AX,im16
    regAX.atribui(ADD16(regAX.valor, dado + (mem[regIP.valor+2].valor << 8)));
    regIP.atribui(regIP.valor + 3);
    break;

  case 0x2a://SUB AL,[ ]
    regAL.atribui(SUB8(regAL.valor, mem[dado].valor));
    regIP.atribui(regIP.valor + 2);
    break;
  case 0x2b://SUB AX,[ ]
    regAX.atribui(SUB16(regAX.valor, mem[dado].valor + (mem[dado+1].valor << 8)));
    regIP.atribui(regIP.valor + 2);
    break;
  case 0x2c://SUB AL,im8
    regAL.atribui(SUB8(regAL.valor, dado));
    regIP.atribui(regIP.valor + 2);
    break;
  case 0x2d://SUB AX,im16
    regAX.atribui(SUB16(regAX.valor, dado + (mem[regIP.valor+2].valor << 8)));
    regIP.atribui(regIP.valor + 3);
    break;

  case 0x3a://CMP AL,[ ]
    SUB8(regAL.valor, mem[dado].valor);
    regIP.atribui(regIP.valor + 2);
    break;
  case 0x3b://CMP AX,[ ]
    SUB16(regAX.valor, mem[dado].valor + (mem[dado+1].valor << 8));
    regIP.atribui(regIP.valor + 2);
    break;
  case 0x3c://CMP AL,im8
    SUB8(regAL.valor, dado);
    regIP.atribui(regIP.valor + 2);
    break;
  case 0x3d://CMP AX,im16
    SUB16(regAX.valor, dado + (mem[regIP.valor+2].valor << 8));
    regIP.atribui(regIP.valor + 3);
    break;

  case 0x72://JC,end8
    if (regFLAGS.carry())  
      regIP.atribui(dado);
    else
      regIP.atribui(regIP.valor + 2);
    break;
  case 0x73://JNC,end8
    if (!regFLAGS.carry())  
      regIP.atribui(dado);
    else
      regIP.atribui(regIP.valor + 2);
    break;
  case 0x74://JZ,end8
    if (regFLAGS.zero())  
      regIP.atribui(dado);
    else
      regIP.atribui(regIP.valor + 2);
    break;
  case 0x75://JNZ,end8
    if (!regFLAGS.carry())  
      regIP.atribui(dado);
    else
      regIP.atribui(regIP.valor + 2);
    break;
  case 0x76://JBE,end8
    if (regFLAGS.carry() || regFLAGS.zero())  
      regIP.atribui(dado);
    else
      regIP.atribui(regIP.valor + 2);
    break;
  case 0x77://JA,end8
    if (!regFLAGS.carry() && !regFLAGS.zero())  
      regIP.atribui(dado);
    else
      regIP.atribui(regIP.valor + 2);
    break;
  case 0x78://JS,end8
    if (regFLAGS.signal())  
      regIP.atribui(dado);
    else
      regIP.atribui(regIP.valor + 2);
    break;
  case 0x79://JNS,end8
    if (!regFLAGS.signal())  
      regIP.atribui(dado);
    else
      regIP.atribui(regIP.valor + 2);
    break;

  case 0xa2://MOV [ ],AL
    mem[dado].atribui(regAL.valor);
    regIP.atribui(regIP.valor + 2);
    break;
  case 0xa3://MOV [ ],AX
    mem[dado].atribui(regAL.valor);
    mem[dado+1].atribui(regAX.valor >> 8);
    regIP.atribui(regIP.valor + 2);
    break;
  case 0xa0://MOV AL,[ ]
    regAL.atribui(mem[dado].valor);
    regIP.atribui(regIP.valor + 2);
    break;
  case 0xa1://MOV AX,[ ]
    regAX.atribui(mem[dado].valor + (mem[dado+1].valor << 8));
    regIP.atribui(regIP.valor + 2);
    break;
  case 0xb0://MOV AL,im8
    regAL.atribui(dado);
    regIP.atribui(regIP.valor + 2);
    break;
  case 0xb8://MOV AX,im16
    regAX.atribui(dado + (mem[regIP.valor+2].valor << 8));
    regIP.atribui(regIP.valor + 3);
    break;

  case 0xeb://JMP,end8
    regIP.atribui(dado);
    break;
    
  case 0xe8://CALL dado
    if (regSP.valor == 0)
      regSP.atribui(DIM * DIM2 - 1);
    else
      regSP.atribui(regSP.valor - 1);
    mem[regSP.valor].atribui(regIP.valor + 2);
    regIP.atribui(dado);
    break;
  case 0xc3://RET
    regIP.atribui(mem[regSP.valor].valor);
    if (regSP.valor >= DIM * DIM2 - 1)
      regSP.atribui(0);
    else
      regSP.atribui(regSP.valor + 1);
    break;
    
  case 0xf4://HLT
    executando = false;
    break;
    
  default:
    executando = false;
  }
}


class Dado extends Entrada {
  int valor;

  Dado(int valor, Componente pai, int x, int y, int larg, int altu) {
    super(str(valor), pai, x, y, larg, altu);
    tamanhoTexto = 14;
    corFundo = 255;
    this.valor = valor;
  } 

  void atribui(int valor) {
    valor &= 0xff;
    this.valor = valor;
    texto = str(valor);
  }

  void atribui(String texto) {
    this.texto = texto;
    int tam = texto.length();
    if (tam > 0) {
      char ult = texto.charAt(tam - 1);
      char h = "h".charAt(0);//defeito processing.js
      char d = "d".charAt(0);//defeito processing.js
      String s = texto.substring(0, tam - 1);
      if (ult == h && tam > 1) {
        valor = unhex(s);
      } else if (ult == d && tam > 1) {
        valor = int(s);
      } else {
        valor = int(texto);
      }
    } else
      valor = int(texto);
    if (valor > 255) {
      atribui(texto.substring(0, tam - 1));
    }
  }

  void desenha() {
    int x = 2;
    stroke(0);
    fill(corFundo);
    rect(0, 0, larg-1, altu-1);
    fill(0);
    textAlign(LEFT, TOP);
    textSize(tamanhoTexto);
    text(texto, x, altu - (textAscent() + textDescent()) - 2);
    if (comFoco) {
      x += (int)textWidth(texto);
      line(x, altu - tamanhoTexto - 2, x, altu - 2);
    }
    desenhaComplemento();
  }

  void desenhaComplemento() {
    textSize(9);
    text(hex(valor, 2) + "h: "+ binary(valor, 16) + "b", 2, 2);
  }

  void teclaDigitada(int tecla, int codigo) {
    super.teclaDigitada(tecla, codigo);
    try {
      atribui(texto);
    } 
    catch (NumberFormatException e) {
      int tam = texto.length();
      texto = texto.substring(0, tam - 1);
    }
  }
}


class PosicaoMemoria extends Dado {
  int endereco = 0;
  String strEnder;
  PosicaoMemoria prox;

  PosicaoMemoria(int valor, int endereco, Componente pai, int x, int y, int larg, int altu) {
    super(valor, pai, x, y, larg, altu);
    this.valor = valor;
    this.endereco = endereco;
    this.prox = prox;
    textSize(tamanhoTexto);
    strEnder = "[" + str(endereco) + "]";
  } 

  void desenhaComplemento() {
    textSize(10);
    if (prox != null)
      text(mnemonic(this), 2, 2);
    text(strEnder, larg - textWidth(strEnder) - 2, altu - textAscent() - textDescent() - 2);
  }

  void teclaDigitada(int tecla, int codigo) {
    super.teclaDigitada(tecla, codigo);
    textSize(tamanhoTexto);
    if (textWidth(texto) > larg - textWidth(strEnder) - 2)
      texto = texto.substring(0, texto.length() - 1);
  }
}

class Registrador extends Dado {
  int numBytes = 1;

  Registrador(int valor, Componente pai, int x, int y, int larg, int altu) {
    super(valor, pai, x, y, larg, altu);
    podeReceberFoco = false;
    corFundo = 240;
  } 

  void desenhaComplemento() {
    textSize(9);
    text(hex(valor, numBytes*2) + "h: "+ binary(valor, numBytes*8) + "b", 2, 2);
  }
}

class RegistradorAL extends Registrador {
  RegistradorAL(int valor, Componente pai, int x, int y, int larg, int altu) {
    super(valor, pai, x, y, larg, altu);
  }

  void atribui(int valor) {
    valor &= 0xff;
    this.valor = valor;
    texto = str(valor);
    regAX.valor = ((regAX.valor & 0xff00) | (valor & 0x00ff));
    regAX.texto = str(regAX.valor);
  }
}

class RegistradorAX extends Registrador {
  RegistradorAX(int valor, Componente pai, int x, int y, int larg, int altu) {
    super(valor, pai, x, y, larg, altu);
  }

  void atribui(int valor) {
    this.valor = valor;
    texto = str(valor);
    regAL.valor = valor & 0xff;
    regAL.texto = str(regAL.valor);
  }
}

class Flags extends Registrador {
  Flags(Componente pai, int x, int y, int larg, int altu) {
    super(0, pai, x, y, larg, altu);
  } 

  boolean carry() {
    return (valor & 0x01) != 0;
  }

  boolean zero() {
    return (valor & 0x40) != 0;
  }

  boolean signal() {
    return (valor & 0x80) != 0;
  }

  void atrib8(int resul) {
    if ((resul & 0x100) != 0)
      valor |= 0x01;
    else
      valor &= ~0x01;
    if (resul == 0)
      valor |= 0x40;
    else
      valor &= ~0x40;
    if ((resul & 0x80) != 0)
      valor |= 0x80;
    else
      valor &= ~0x80;
  }

  void atrib16(int resul) {
    if ((resul & 0x10000) != 0)
      valor |= 0x01;
    else
      valor &= ~0x01;
    if (resul == 0)
      valor |= 0x40;
    else
      valor &= ~0x40;
    if ((resul & 0x8000) != 0)
      valor |= 0x80;
    else
      valor &= ~0x80;
  }

  void desenha() {
    texto = "";
    if (carry())
      texto += "C: 1";
    else 
      texto += "C: 0";
    if (zero())
      texto += "  Z: 1";
    else 
      texto += "  Z: 0";
    // if (signal())
    //   texto += "  S: 1";
    // else 
    //   texto += "  S: 0";
    super.desenha();
  }
}

class PainelMemoria extends Painel {
  PainelMemoria(Componente pai, int x, int y, int larg, int altu) {
    super(pai, x, y, larg, altu);
    corFundo = 224;
  }

  void desenha() {
    stroke(0);
    fill(corFundo);
    rect(0, 0, larg, altu); 
    textSize(16);   
    textAlign(CENTER, TOP);
    fill(0);
    text("Memória", larg/2, 2);
  }
}

class PainelCPU extends Painel {
  PainelCPU(Componente pai, int x, int y, int larg, int altu) {
    super(pai, x, y, larg, altu);
    corFundo = 224;
  }

  void desenha() {
    stroke(0);
    fill(corFundo);
    rect(0, 0, larg, altu); 
    textSize(16);   
    textAlign(CENTER, TOP);
    fill(0);
    text("Registradores da CPU", larg/2, 2);
  }
}

class Principal extends IGU {
  void atualizaComponentes() {
    if (executando)
      passo();
    super.atualizaComponentes();
  }

  void salvaArq(String nome) {
    if (nome.length() == 0)
      return;
    String [] lista = new String[DIM*DIM];
    for (int i = 0; i < DIM*DIM; i++) {
      lista[i] = mem[i].texto;
    }  
    saveStrings(nome, lista);
  }

  void carregaArq(String nome) {
    if (nome.length() == 0)
      return;
    String [] lista;
    lista = loadStrings(nome);
    for (int i = 0; i < lista.length; i++) {
      mem[i].atribui(lista[i]);
    }
    reset();
  }

  void reset() {
    regAX.atribui(0);
    regIP.atribui(0);
    regSP.atribui(0);
    regFLAGS.atribui(0);
  }

  void passo() {
    executa();
  }

  void acao(Componente c) {
    if (c instanceof Botao) {
      if (c == bReset) {
        reset();
      } else if (c == bPasso) {
        passo();
      } else if (c == bExec) {
        executando = true;
      } else if (c == bSalva) {
        salvaArq(nomeArq.texto);
      } else if (c == bCarrega) {
        carregaArq(nomeArq.texto);
      }
    }
  }
}

Principal principal;

void setup() {
  size(780, 550);
  principal = new Principal();

  final int LARG_MEM = 70;
  final int ALTU_MEM = 32;
  final int ESPACO = 5; 
  final int ESPACO_TITULO = 25;
  final int LARG_REG_8_BIT = 80;
  PainelMemoria p = new PainelMemoria(principal, 12, ESPACO*2 + 115, DIM*(LARG_MEM+ESPACO)+ESPACO, ESPACO_TITULO+DIM*(ALTU_MEM+ESPACO)+ESPACO);

  for (int i = 0; i < DIM2; i++) 
    for (int j=0; j < DIM; j++ ) {
      mem[i*DIM+j] = new PosicaoMemoria(0, i*DIM+j, p, ESPACO+i*(LARG_MEM+ESPACO), ESPACO_TITULO+j*(ALTU_MEM+ESPACO), LARG_MEM, ALTU_MEM);
    }
  for (int i = 1; i < DIM2*DIM; i++) {
    mem[i-1].proxTabComponente = mem[i];
    mem[i-1].prox = mem[i];
  }
  mem[DIM2*(DIM - 1)].proxTabComponente = mem[0];
  mem[DIM2*(DIM - 1)].prox = mem[0];

  PainelCPU pc = new PainelCPU(principal, 12, 25, p.larg - ESPACO * 8 - LARG_MEM * 2, 85);
  int pos = ESPACO;

  Rotulo r;
  (r = new Rotulo("AX: ", pc, pos, ESPACO_TITULO, 40, ALTU_MEM)).alinha = RIGHT;
  pos += r.larg + ESPACO;
  regAX = new RegistradorAX(0, pc, pos, ESPACO_TITULO, LARG_MEM*2+ESPACO, ALTU_MEM);
  regAX.numBytes = 2;
  pos += (LARG_MEM + ESPACO)*2;

  new Rotulo("AL: ", pc, regAX.x + regAX.larg - LARG_REG_8_BIT - 100, ESPACO_TITULO + regAX.altu - 10, 100, ALTU_MEM).alinha = RIGHT;
  regAL = new RegistradorAL(0, pc, regAX.x + regAX.larg - LARG_REG_8_BIT, ESPACO_TITULO + regAX.altu - 10, LARG_REG_8_BIT, ALTU_MEM);

  (r = new Rotulo("Flags:", pc, pos, ESPACO_TITULO, r.larg, ALTU_MEM)).alinha = RIGHT;
  pos += r.larg + ESPACO;
  regFLAGS = new Flags(pc, pos, ESPACO_TITULO, LARG_REG_8_BIT, ALTU_MEM);
  regFLAGS.tamanhoTexto = 11;
  pos += LARG_MEM + ESPACO;

  (r = new Rotulo("IP:", pc, pos, ESPACO_TITULO, r.larg, ALTU_MEM)).alinha = RIGHT;
  pos += r.larg + ESPACO;
  regIP = new Registrador(0, pc, pos, ESPACO_TITULO, LARG_REG_8_BIT, ALTU_MEM);
  pos += LARG_MEM + ESPACO;

  (r = new Rotulo("SP:", pc, pos, ESPACO_TITULO, r.larg, ALTU_MEM)).alinha = RIGHT;
  pos += r.larg + ESPACO;
  regSP = new Registrador(0, pc, pos, ESPACO_TITULO, LARG_REG_8_BIT, ALTU_MEM);
  pos += LARG_MEM + ESPACO;

  Painel bts = new Painel(principal, pc.x + pc.larg + ESPACO * 2, 25, ESPACO * 6 + LARG_MEM * 2, pc.altu);
  bReset = new Botao("Reset", bts, ESPACO, ESPACO, 50, 20);
  bPasso = new Botao("Passo", bts, bReset.x + bReset.larg + ESPACO, ESPACO, bReset.larg, bReset.altu);
  bExec = new Botao("Exec.", bts, bPasso.x + bPasso.larg + ESPACO, ESPACO, bPasso.larg, bPasso.altu);

  new Rotulo("Arquivo:", bts, bReset.x, bReset.y + bReset.altu, bts.larg - ESPACO*2, bReset.altu).alinha = CENTER;

  nomeArq = new Entrada("", bts, bReset.x, bReset.y + bReset.altu*2 - 2, bts.larg - ESPACO*2, bReset.altu);
  nomeArq.corFundo = 255;

  bCarrega = new Botao("Carrega", bts, ESPACO, nomeArq.y + nomeArq.altu + ESPACO - 2, (nomeArq.larg - ESPACO) / 2, bReset.altu);
  bSalva = new Botao("Salva", bts, bCarrega.x + bCarrega.larg + ESPACO + 1, nomeArq.y + nomeArq.altu + ESPACO - 2, bCarrega.larg, bCarrega.altu);
  pc.altu = bts.altu = bSalva.y + bSalva.altu + ESPACO;
}

void draw() {
  principal.atualizaComponentes();
}
import java.util.ArrayList;

class Componente {

  Componente pai;
  ArrayList<Componente> componentes = new ArrayList<Componente>();
  int x, y, larg, altu, xAbs, yAbs;
  int corFundo = 128;
  boolean podeReceberFoco = true;
  int tamanhoTexto = 12;
  Componente proxTabComponente = null;
  boolean visivel = true;

  Componente(Componente pai, int x, int y, int larg, int altu) {
    xAbs = pai.xAbs + x;
    yAbs = pai.yAbs + y;
    init(pai, x, y, larg, altu);
    pai.componentes.add(this);
  }

  Componente(int x, int y, int larg, int altu) {
    xAbs = x;
    yAbs = y;
    init(null, x, y, larg, altu);
  }

  void init(Componente pai, int x, int y, int larg, int altu) {
    this.pai = pai;
    this.x = x;
    this.y = y;
    this.larg = larg;
    this.altu = altu;
  }

  boolean dentroDoComponente(int x, int y) {
    return xAbs <= x && x <= xAbs + larg && yAbs <= y && y <= yAbs + altu;
  }

  void atualizaComponentes() {
    pushMatrix();
    translate(xAbs, yAbs);
    if (visivel)
      desenha();
    popMatrix();
    for (Componente c : componentes)
      c.atualizaComponentes();
  }

  void desenha() {
    stroke(0);
    fill(corFundo);
    rect(0, 0, larg, altu);
  }

  void acao(Componente c) {
    if (pai != null)
      pai.acao(c);
  }

  void mouseEntrou(int x, int y) {
  }

  void mouseSaiu() {
  }

  void mouseApertou(int botao, int x, int y) {
  }

  void mouseSoltou(int botao, int x, int y) {
  }

  void mouseClicou(int botao, int x, int y) {
  }

  void perdeuFoco(Componente receberaFoco) {
  }

  void ganhouFoco(Componente perdeuFoco) {
  }

  void teclaPressionada(int tecla, int codigo) {
  }

  void teclaLiberada(int tecla, int codigo) {
  }

  void teclaDigitada(int tecla, int codigo) {
  }
}

class Rotulo extends Componente {
  String texto;
  int alinha = LEFT;

  Rotulo(String texto, Componente pai, int x, int y, int larg, int altu) {
    super(pai, x, y, larg, altu);
    this.texto = texto;
    podeReceberFoco = false;
  }

  void alinhamento(int alinha) {
    this.alinha = alinha;
  }

  void desenha() {
    int x = 2;
    textSize(tamanhoTexto);
    fill(0);
    textAlign(LEFT, BOTTOM);
    switch (alinha) {
    case CENTER:
      x = (larg - (int)textWidth(texto)) / 2;
      break;
    case RIGHT:
      x = larg - (int)textWidth(texto) - 2;
      break;
    }
    text(texto, x, (altu + (textAscent() + textDescent()))/2);
  }
}

class Botao extends Componente {
  String texto;
  boolean botaoPressionado = false;

  Botao(String texto, Componente pai, int x, int y, int larg, int altu) {
    super(pai, x, y, larg, altu);
    this.texto = texto;
    corFundo = 192;
  }

  void mouseApertou(int botao, int x, int y) {
    botaoPressionado = true;
  }

  void mouseSoltou(int botao, int x, int y) {
    botaoPressionado = false;
  }

  void mouseSaiu() {
    botaoPressionado = false;
  }

  void mouseClicou(int botao, int x, int y) {
    acao(this);
  }

  void desenha() {
    textSize(tamanhoTexto);
    textAlign(LEFT, BOTTOM);
    if (botaoPressionado) {
      noStroke();
      fill(corFundo);
      rect(0, 0, larg-1, altu-1);
      stroke(255);
      line(1, altu - 1, larg - 1, altu - 1);
      line(larg - 1, 1, larg - 1, altu - 1);
      stroke(0);
      line(0, 0, 0, altu-2);
      line(0, 0, larg - 2, 0);
      fill(0);
      text(texto, (larg - (int)textWidth(texto)) / 2 + 1, (altu + (textAscent() + textDescent()))/2 + 1);
    } else {
      noStroke();
      fill(corFundo);
      rect(0, 0, larg-1, altu-1);
      stroke(0);
      line(1, altu - 1, larg - 1, altu - 1);
      line(larg - 1, 1, larg - 1, altu - 1);
      stroke(255);
      line(0, 0, 0, altu - 3);
      line(0, 0, larg - 3, 0);
      fill(0);
      text(texto, (larg - (int)textWidth(texto)) / 2, (altu + (textAscent() + textDescent()))/2);
    }
  }
}

class Entrada extends Componente {
  String texto;
  int alinha = LEFT;
  boolean botaoPressionado = false;
  boolean comFoco = false;

  Entrada(String texto, Componente pai, int x, int y, int larg, int altu) {
    super(pai, x, y, larg, altu);
    this.texto = texto;
    corFundo = 224;
  }

  void alinhamento(int alinha) {
    this.alinha = alinha;
  }

  void perdeuFoco(Componente receberaFoco) {
    comFoco = false;
  }

  void ganhouFoco(Componente perdeuFoco) {
    comFoco = true;
  }

  void desenha() {
    int x = 2;
    stroke(0);
    fill(corFundo);
    rect(0, 0, larg-1, altu-1);
    fill(0);
    textAlign(LEFT, BOTTOM);
    switch (alinha) {
    case CENTER:
      x = (larg - (int)textWidth(texto)) / 2;
      break;
    case RIGHT:
      x = larg - (int)textWidth(texto) - 2;
      break;
    }
    textSize(tamanhoTexto);
    text(texto, x, (altu + (textAscent() + textDescent()))/2);
    x += (int)textWidth(texto);
    if (comFoco)
      line(x, 2, x, altu-3);
  }

  void teclaDigitada(int tecla, int codigo) {
    if (tecla == CODED)
      return;
    if (tecla == DELETE || tecla == BACKSPACE) {
      if (texto.length() > 0) {
        texto = texto.substring(0, texto.length() - 1);
      }
    } else if (tecla == ENTER) {
      acao(this);
    } else {
      texto = texto + str((char)tecla);//defeito processing.js
      textSize(tamanhoTexto);
      if (textWidth(texto) > larg - 4)
        texto = texto.substring(0, texto.length() - 1);
    }
  }
}

class Painel extends Componente { 
  Painel(Componente pai, int x, int y, int larg, int altu) {
    super(pai, x, y, larg, altu);
    corFundo = 224;
  }

  void desenha() {
    stroke(0);
    fill(corFundo);
    rect(0, 0, larg, altu);
  }
}

class IGU extends Componente {
  IGU() {
    super(0, 0, width - 1, height - 1);
    Raiz.igu = this;
  }

  Componente componenteNoPonto(Componente cAtual, int x, int y) {
    if (cAtual.dentroDoComponente(x, y)) {
      for (Componente c : cAtual.componentes) {
        Componente result = componenteNoPonto(c, x, y);
        if (result != null)
          return result;
      }
      return cAtual;
    }
    return null;
  }
}

static class Raiz {
  static IGU igu = null;
  static Componente mouseNoComponente = null;
  static Componente componenteComFoco; 

  static void mouseApertou(int botao, int x, int y) {
    Componente c = igu.componenteNoPonto(igu, x, y);
    if (c == null) 
      return;
    c.mouseApertou(botao, x - c.xAbs, y - c.yAbs);
    if (componenteComFoco != c && c.podeReceberFoco && c.visivel) {
      if (componenteComFoco != null)
        componenteComFoco.perdeuFoco(c);
      c.ganhouFoco(componenteComFoco);
      componenteComFoco = c;
    }
  }

  static void mouseClicou(int botao, int x, int y) {
    Componente c = igu.componenteNoPonto(igu, x, y);
    if (c == null) 
      return;
    c.mouseClicou(botao, x - c.xAbs, y - c.yAbs);
  }

  static void mouseSoltou(int botao, int x, int y) {
    Componente c = igu.componenteNoPonto(igu, x, y);
    if (c == null) 
      return;
    c.mouseSoltou(botao, x - c.xAbs, y - c.yAbs);
  }

  static void mouseMoveu(int x, int y) {
    Componente c = igu.componenteNoPonto(igu, x, y);
    if (c != null) {
      if (mouseNoComponente != c) {
        if (mouseNoComponente != null)
          mouseNoComponente.mouseSaiu();
        c.mouseEntrou(x - c.xAbs, y - c.yAbs);
        mouseNoComponente = c;
      }
    }
  }
}

public void keyPressed() {
  if (Raiz.componenteComFoco != null)
    Raiz.componenteComFoco.teclaPressionada(key, keyCode);
}

void keyTyped() {
  if (Raiz.componenteComFoco != null) {
    if (key == TAB) {
      Componente prox = Raiz.componenteComFoco.proxTabComponente;
      if (prox != null && prox.podeReceberFoco && prox.visivel) {
        Raiz.componenteComFoco.perdeuFoco(prox);
        prox.ganhouFoco(Raiz.componenteComFoco);
        Raiz.componenteComFoco = prox;
      }
    } else
      Raiz.componenteComFoco.teclaDigitada(key, keyCode);
  }
}

void keyReleased() {
  if (Raiz.componenteComFoco != null)
    Raiz.componenteComFoco.teclaLiberada(key, keyCode);
}

void mousePressed() {
  Raiz.mouseApertou(mouseButton, mouseX, mouseY);
}

void mouseClicked() {
  Raiz.mouseClicou(mouseButton, mouseX, mouseY);
}

void mouseReleased() {
  Raiz.mouseSoltou(mouseButton, mouseX, mouseY);
}

void mouseMoved() {
  Raiz.mouseMoveu(mouseX, mouseY);
}

static class Tipos {
  static boolean ehDigito(char c) {
    return '0' <= c && c <= '9';
  }
  static boolean ehLetra(char c) {
    c |= 32;
    return 'a' <= c && c <= 'z';
  }
  static boolean ehSimbolo(char c) {
    return !ehDigito(c) && !ehLetra(c);
  }
  static boolean ehDigitoHex(char c) {
    char cl = (char)(c | 32);
    return '0' <= c && c <= '9' || 'a' <= cl && cl <= 'f';
  }
  static boolean ehDigitoBIN(char c) {
    return '0' <= c && c <= '1';
  }
}


