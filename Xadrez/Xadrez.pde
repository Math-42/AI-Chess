int TAMANHO_CASA=100;
Peca[] pecas = new Peca[32];
int[][] tabuleiro = new int[8][8];
boolean movendo = false;
int pecaSelecionada;
PImage pb,pp,rb,rp,Rb,Rp,tb,tp,cb,cp,bb,bp;

void setup(){
  size(1250,950);
  carregarImagens();
  declaracaoPecas();
  for(int i=0;i<8;i++){
    for(int j=0;j<8;j++){
      tabuleiro[i][j]= -1;
    }
  }
  AtualizaTabuleiro();
}

void draw(){
  background(100);
  criacaoTabuleiro();
  desenhaPecas();
}

void criacaoTabuleiro(){
  for(int i = 0;i<8;i++){
    for(int j = 0;j<8;j++){
      if(j%2==1 && i%2==0 || i%2==1 && j%2==0){
        fill(2);
      }
      else{
        fill(255);
      }
      rect((i*TAMANHO_CASA)+225,(j*TAMANHO_CASA)+75,TAMANHO_CASA,TAMANHO_CASA);
      if(detectaMouse((i*TAMANHO_CASA)+225,(j*TAMANHO_CASA)+75,TAMANHO_CASA,TAMANHO_CASA)==1){
        fill(94,194,232,100);
        rect((i*TAMANHO_CASA)+225,(j*TAMANHO_CASA)+75,100,100);
      }
    }
  }
}

int detectaMouse(int posX, int posY, int larg,int alt){
  if(mouseX>posX && mouseX<posX+larg && mouseY>posY && mouseY<posY+alt){
    return 1;
  }
  else{
    return 0;
  }
}

class Peca{ 
  int posX;
  int posY;
  int posInitX;
  int posInitY;
  char nome;
  boolean tab;
  boolean movendo;
  char cor;
  PImage imagem;
  float imageX;
  Peca (int TempPosX,int TempPosY,int TempPosInitX,int TempPosInitY, char TempNome, boolean TempTab,boolean TempMovendo, char TempCor, PImage TempImagem, float TempImageX){  
    posX = TempPosX;
    posY = TempPosY;
    posInitX = TempPosInitX;
    posInitY = TempPosInitY;
    nome = TempNome;
    tab = TempTab; 
    movendo = TempMovendo; 
    cor = TempCor;
    imagem = TempImagem;
    imageX = TempImageX;
  } 
}

void declaracaoPecas(){
  for(int i =0; i<8;i++){
    pecas[i] = new Peca(i,1,i,1,'p',true,false,'b',pb,72);
    pecas[i+8] = new Peca(i,6,i,6,'p',true,false,'p',pp,72);
  }
  pecas[16] = new Peca(0,0,0,0,'t',true,false,'b',tb,69);
  pecas[17] = new Peca(7,0,7,0,'t',true,false,'b',tb,69);
  pecas[18] = new Peca(0,7,0,7,'t',true,false,'p',tp,69);
  pecas[19] = new Peca(7,7,7,7,'t',true,false,'p',tp,69);
  pecas[20] = new Peca(1,0,1,0,'c',true,false,'b',cb,71);
  pecas[21] = new Peca(6,0,6,0,'c',true,false,'b',cb,71);
  pecas[22] = new Peca(1,7,1,7,'c',true,false,'p',cp,71);
  pecas[23] = new Peca(6,7,6,7,'c',true,false,'p',cp,71);
  pecas[24] = new Peca(2,0,2,0,'b',true,false,'b',bb,48);
  pecas[25] = new Peca(5,0,5,0,'b',true,false,'b',bb,48);
  pecas[26] = new Peca(2,7,2,7,'b',true,false,'p',bp,48);
  pecas[27] = new Peca(5,7,5,7,'b',true,false,'p',bp,48);
  pecas[28] = new Peca(3,0,3,0,'R',true,false,'b',Rb,36);
  pecas[29] = new Peca(3,7,3,7,'R',true,false,'p',Rp,36);
  pecas[30] = new Peca(4,0,4,0,'r',true,false,'b',rb,44);
  pecas[31] = new Peca(4,7,4,7,'r',true,false,'p',rp,44);
}

void desenhaPecas(){
  for(int i =0; i<32;i++){
    if(pecas[i].tab){
      if(!pecas[i].movendo){
        image(pecas[i].imagem,pecas[i].posX*100+225+((100-pecas[i].imageX)/2),pecas[i].posY*100+77,pecas[i].imageX,96);
      }
      else{
        image(pecas[i].imagem,mouseX-(pecas[i].imageX/2),mouseY-48,pecas[i].imageX,96);
      }
    }
  }
}

void AtualizaTabuleiro(){
  for(int i = 0; i<32; i++){
    tabuleiro[pecas[i].posX][pecas[i].posY]=i;
  }
}

void mouseClicked(){
  for(int i=0;i<8;i++){
    for(int j=0;j<8;j++){
      if(detectaMouse((i*TAMANHO_CASA)+225,(j*TAMANHO_CASA)+75,TAMANHO_CASA,TAMANHO_CASA)==1){
        if(movendo == false){
          pecas[tabuleiro[i][j]].movendo = true;
          pecaSelecionada = tabuleiro[i][j];
          tabuleiro[i][j] = -1;
          movendo = true;
        }
        else{
          if((tabuleiro[i][j]==-1 || pecas[tabuleiro[i][j]].cor != pecas[pecaSelecionada].cor ) && testaCasa(pecas[pecaSelecionada].nome,pecas[pecaSelecionada].cor,i,j)== true){
            if(tabuleiro[i][j]!=-1){
              pecas[tabuleiro[i][j]].tab=false;
            }
            pecas[pecaSelecionada].movendo = false;
            pecas[pecaSelecionada].posX = i;
            pecas[pecaSelecionada].posY = j;
            tabuleiro[i][j] = pecaSelecionada;
            movendo = false;
          }
        }
      }
    }
  }
}

void carregarImagens(){
  pb = loadImage("PB.png");
  pp = loadImage("PP.png");
  tb = loadImage("TB.png");
  tp = loadImage("TP.png");
  cb = loadImage("CB.png");
  cp = loadImage("CP.png");
  bb = loadImage("BB.png");
  bp = loadImage("BP.png");
  Rb = loadImage("KB.png");
  Rp = loadImage("KP.png");
  rb = loadImage("RB.png");
  rp = loadImage("RP.png");
}

boolean testaCasa(char nome,char cor,int i,int j){
  if(nome=='p'){
    
  }
  if(nome=='t'){
    
  }
  if(nome=='c'){
  }
  if(nome=='b'){
  }
  if(nome=='R'){
  }
  if(nome=='r'){
  }
  return true;
}
