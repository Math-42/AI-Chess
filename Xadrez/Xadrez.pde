int TAMANHO_CASA=100;
Peca[] pecas = new Peca[32];


void setup(){
  size(1250,950);
  pecas[0] = new Peca(1,1,1,1,'a','a','a','a');
}

void draw(){
  background(100);
  criacaoTabuleiro();
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
  char id;
  int tab;
  char cor;
  Peca (int TempPosX,int TempPosY,int TempPosInitX,int TempPosInitY, char TempNome, char TempId, char TempTab, char TempCor){  
    posX = TempPosX;
    posY = TempPosY;
    posInitX = TempPosInitX;
    posInitY = TempPosInitY;
    nome = TempNome;
    id = TempId;
    tab = TempTab; 
    cor = TempCor;
  } 
}
