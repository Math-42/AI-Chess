int TAMANHO_CASA=100;
Peca[] pecas = new Peca[32];
int[][] tabuleiro = new int[8][8];
boolean movendo = false;
int pecaMovida;

void setup(){
  size(1250,950);
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
  Peca (int TempPosX,int TempPosY,int TempPosInitX,int TempPosInitY, char TempNome, boolean TempTab,boolean TempMovendo, char TempCor){  
    posX = TempPosX;
    posY = TempPosY;
    posInitX = TempPosInitX;
    posInitY = TempPosInitY;
    nome = TempNome;
    tab = TempTab; 
    movendo = TempMovendo; 
    cor = TempCor;
  } 
}

void declaracaoPecas(){
  for(int i =0; i<8;i++){
    pecas[i] = new Peca(i,1,i,1,'p',true,false,'b');
    pecas[i+8] = new Peca(i,6,i,6,'p',true,false,'p');
  }
  pecas[16] = new Peca(0,0,0,0,'t',true,false,'b');
  pecas[17] = new Peca(7,0,7,0,'t',true,false,'b');
  pecas[18] = new Peca(0,7,0,7,'t',true,false,'p');
  pecas[19] = new Peca(7,7,7,7,'t',true,false,'p');
  pecas[20] = new Peca(1,0,1,0,'c',true,false,'b');
  pecas[21] = new Peca(6,0,6,0,'c',true,false,'b');
  pecas[22] = new Peca(1,7,1,7,'c',true,false,'p');
  pecas[23] = new Peca(6,7,6,7,'c',true,false,'p');
  pecas[24] = new Peca(2,0,2,0,'b',true,false,'b');
  pecas[25] = new Peca(5,0,5,0,'b',true,false,'b');
  pecas[26] = new Peca(2,7,2,7,'b',true,false,'p');
  pecas[27] = new Peca(5,7,5,7,'b',true,false,'p');
  pecas[28] = new Peca(3,0,3,0,'R',true,false,'b');
  pecas[29] = new Peca(4,7,4,7,'R',true,false,'b');
  pecas[30] = new Peca(4,0,4,0,'r',true,false,'p');
  pecas[31] = new Peca(3,7,3,7,'r',true,false,'p');
}

void desenhaPecas(){
  for(int i =0; i<32;i++){
    if(!pecas[i].movendo){
      rect(pecas[i].posX*100+255,pecas[i].posY*100+105,40,40);
    }
    else{
      rect(mouseX-20,mouseY-20,40,40);
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
          pecaMovida = tabuleiro[i][j];
          tabuleiro[i][j] = -1;
          movendo = true;
        }
        else{
          if(tabuleiro[i][j]==-1){
            pecas[pecaMovida].movendo = false;
            pecas[pecaMovida].posX = i;
            pecas[pecaMovida].posY = j;
            tabuleiro[i][j] = pecaMovida;
            movendo = false;
          }
        }
      }
    }
  }
}
