boolean testaCasa(char nome,char cor,int x,int y){
  if(nome=='p'){
    if(cor == 'p'){
      if(x-1>=0 && y-1>=0){
        if(tabuleiro[x-1][y-1]!=-1 && pecas[tabuleiro[x-1][y-1]].cor!=pecas[pecaSelecionada].cor){
            movimentos[0][2]= 2;
            movimentos[0][0]= x-1;
            movimentos[0][1]= y-1;
            println(x-1,y-1);
        }
      }
      else{
        movimentos[0][2]= 0;
      }
      if(y-1>=0){
        if(tabuleiro[x][y-1]==-1){
          movimentos[1][2]= 1;
          movimentos[1][0]= x;
          movimentos[1][1]= y-1;
        }
        if(pecas[pecaSelecionada].contMovimentos == 0){
          movimentos[3][2]= 1;
          movimentos[3][0]= x;
          movimentos[3][1]= y-2;
        }
      }
      else{
        movimentos[1][2]= 0;
      }
      if(x+1<8 && y-1>=0){
        if(tabuleiro[x+1][y-1]!=-1 && pecas[tabuleiro[x+1][y-1]].cor!=pecas[pecaSelecionada].cor){
          movimentos[2][2]= 2;
          movimentos[2][0]= x+1;
          movimentos[2][1]= y-1;
        }
      }
      else{
        movimentos[2][2]= 0;
      }
    }
    if(cor == 'b'){
      if(x-1>=0 && y+1<8){
        if(tabuleiro[x-1][y+1]!=-1 && pecas[tabuleiro[x-1][y+1]].cor!=pecas[pecaSelecionada].cor){
            movimentos[0][2]= 2;
            movimentos[0][0]= x-1;
            movimentos[0][1]= y+1;
        }
      }
      else{
        movimentos[0][2]= 0;
      }
      if(y+1<8){
        if(tabuleiro[x][y+1]==-1){
          movimentos[1][2]= 1;
          movimentos[1][0]= x;
          movimentos[1][1]= y+1;
        }
        if(pecas[pecaSelecionada].contMovimentos == 0){
          movimentos[3][2]= 1;
          movimentos[3][0]= x;
          movimentos[3][1]= y+2;
        }
      }
      else{
        movimentos[1][2]= 0;
      }
      if(x+1<8 && y+1<8){
        if(tabuleiro[x+1][y+1]!=-1 && pecas[tabuleiro[x+1][y+1]].cor!=pecas[pecaSelecionada].cor){
          movimentos[2][2]=2;
          movimentos[2][0]= x+1;
          movimentos[2][1]= y+1;
        }
      }
      else{
        movimentos[2][2]= 0;
      }
    }
  }
  if(nome=='t'){
    int contador=1;
    int tempX = x;
    int tempY = y;
    while(tempX<7){
      tempX++;
      if(tabuleiro[tempX][y]==-1){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= y;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[tempX][y]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= y;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
    while(tempY<7){
      tempY++;
      if(tabuleiro[x][tempY]==-1){
        movimentos[contador][0]= x;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[x][tempY]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= x;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
    tempX = x;
    while(tempX-1>=0){
      tempX--;
      if(tabuleiro[tempX][y]==-1){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= y;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[tempX][y]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= y;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
    tempY = y;
    while(tempY-1>=0){
      tempY--;
      if(tabuleiro[x][tempY]==-1){
        movimentos[contador][0]= x;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[x][tempY]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= x;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
  }
  if(nome=='c'){
    if(y-2>=0){
      if(x-1>=0){
        if(tabuleiro[x-1][y-2]==-1){
          movimentos[1][0]= x-1;
          movimentos[1][1]= y-2;
          movimentos[1][2]= 1;
        }
        else if(pecas[tabuleiro[x-1][y-2]].cor!=pecas[pecaSelecionada].cor){
          movimentos[1][0]= x-1;
          movimentos[1][1]= y-2;
          movimentos[1][2]= 2;
        }
      }
      if(x+1<8){
        if(tabuleiro[x+1][y-2]==-1){
          movimentos[2][0]= x+1;
          movimentos[2][1]= y-2;
          movimentos[2][2]= 1;
        }
        else if(pecas[tabuleiro[x+1][y-2]].cor!=pecas[pecaSelecionada].cor){
          movimentos[2][0]= x+1;
          movimentos[2][1]= y-2;
          movimentos[2][2]= 2;
        }
      }
    }
    if(y+2<8){
      if(x-1>=0){
        if(tabuleiro[x-1][y+2]==-1){
          movimentos[3][0]= x-1;
          movimentos[3][1]= y+2;
          movimentos[3][2]= 1;
        }
        else if(pecas[tabuleiro[x-1][y+2]].cor!=pecas[pecaSelecionada].cor){
          movimentos[3][0]= x-1;
          movimentos[3][1]= y+2;
          movimentos[3][2]= 2;
        }
      }
      if(x+1<8){
        if(tabuleiro[x+1][y+2]==-1){
          movimentos[4][0]= x+1;
          movimentos[4][1]= y+2;
          movimentos[4][2]= 1;
        }
        else if(pecas[tabuleiro[x+1][y+2]].cor!=pecas[pecaSelecionada].cor){
          movimentos[4][0]= x+1;
          movimentos[4][1]= y+2;
          movimentos[4][2]= 2;
        }
      }
    }
    if(x-2>=0){
      if(y-1>=0){
        if(tabuleiro[x-2][y-1]==-1){
          movimentos[5][0]= x-2;
          movimentos[5][1]= y-1;
          movimentos[5][2]= 1;
        }
        else if(pecas[tabuleiro[x-2][y-1]].cor!=pecas[pecaSelecionada].cor){
          movimentos[5][0]= x-2;
          movimentos[5][1]= y-1;
          movimentos[5][2]= 2;
        }
      }
      if(y+1<8){
        if(tabuleiro[x-2][y+1]==-1){
          movimentos[6][0]= x-2;
          movimentos[6][1]= y+1;
          movimentos[6][2]= 1;
        }
        else if(pecas[tabuleiro[x-2][y+1]].cor!=pecas[pecaSelecionada].cor){
          movimentos[6][0]= x-2;
          movimentos[6][1]= y+1;
          movimentos[6][2]= 2;
        }
      }
    }
    if(x+2<8){
      if(y-1>=0){
        if(tabuleiro[x+2][y-1]==-1){
          movimentos[7][0]= x+2;
          movimentos[7][1]= y-1;
          movimentos[7][2]= 1;
        }
        else if(pecas[tabuleiro[x+2][y-1]].cor!=pecas[pecaSelecionada].cor){
          movimentos[7][0]= x+2;
          movimentos[7][1]= y-1;
          movimentos[7][2]= 2;
        }
      }
      if(y+1<8){
        if(tabuleiro[x+2][y+1]==-1){
          movimentos[8][0]= x+2;
          movimentos[8][1]= y+1;
          movimentos[8][2]= 1;
        }
        else if(pecas[tabuleiro[x+2][y+1]].cor!=pecas[pecaSelecionada].cor){
          movimentos[8][0]= x+2;
          movimentos[8][1]= y+1;
          movimentos[8][2]= 2;
        }
      }
    }
  }
  if(nome=='b'){
    int contador=1;
    int tempX = x;
    int tempY = y;
    while(tempX<7 && tempY<7){
      tempX++;tempY++;
      if(tabuleiro[tempX][tempY]==-1){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[tempX][tempY]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
    tempX = x;
    tempY = y;
    while(tempX-1>=0 && tempY<7){
      tempY++;tempX--;
      if(tabuleiro[tempX][tempY]==-1){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[tempX][tempY]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
    tempX = x;
    tempY = y;
    while(tempX-1>=0 && tempY-1>=0){
      tempX--; tempY--;
      if(tabuleiro[tempX][tempY]==-1){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[tempX][tempY]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
    tempX = x;
    tempY = y;
    while(tempY-1>=0 && tempX<7){
      tempY--;tempX++;
      if(tabuleiro[tempX][tempY]==-1){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[tempX][tempY]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
  }
  if(nome=='R'){
    if(x<7){
      if(tabuleiro[x+1][y]==-1){
        movimentos[0][0]= x+1;
        movimentos[0][1]= y;
        movimentos[0][2]= 1;
      }
      else if(pecas[tabuleiro[x+1][y]].cor!=pecas[pecaSelecionada].cor){
        movimentos[0][0]= x+1;
        movimentos[0][1]= y;
        movimentos[0][2]= 2;
      }
    }
    if(x<7 && y<7){
      if(tabuleiro[x+1][y+1]==-1){
        movimentos[1][0]= x+1;
        movimentos[1][1]= y+1;
        movimentos[1][2]= 1;
      }
      else if(pecas[tabuleiro[x+1][y+1]].cor!=pecas[pecaSelecionada].cor){
        movimentos[1][0]= x+1;
        movimentos[1][1]= y+1;
        movimentos[1][2]= 2;
      }
    }
    if(y<7){
      if(tabuleiro[x][y+1]==-1){
        movimentos[2][0]= x;
        movimentos[2][1]= y+1;
        movimentos[2][2]= 1;
      }
      else if(pecas[tabuleiro[x][y+1]].cor!=pecas[pecaSelecionada].cor){
        movimentos[2][0]= x;
        movimentos[2][1]= y+1;
        movimentos[2][2]= 2;
      }
    }
    if(x-1>=0 && y<7){
      if(tabuleiro[x-1][y+1]==-1){
        movimentos[3][0]= x-1;
        movimentos[3][1]= y+1;
        movimentos[3][2]= 1;
      }
      else if(pecas[tabuleiro[x-1][y+1]].cor!=pecas[pecaSelecionada].cor){
        movimentos[3][0]= x-1;
        movimentos[3][1]= y+1;
        movimentos[3][2]= 2;
      }
    }
    if(x-1>=0){
      if(tabuleiro[x-1][y]==-1){
        movimentos[4][0]= x-1;
        movimentos[4][1]= y;
        movimentos[4][2]= 1;
      }
      else if(pecas[tabuleiro[x-1][y]].cor!=pecas[pecaSelecionada].cor){
        movimentos[4][0]= x-1;
        movimentos[4][1]= y;
        movimentos[4][2]= 2;
      }
    }
    if(x-1>=0 && y-1>=0){
      if(tabuleiro[x-1][y-1]==-1){
        movimentos[5][0]= x-1;
        movimentos[5][1]= y-1;
        movimentos[5][2]= 1;
      }
      else if(pecas[tabuleiro[x-1][y-1]].cor!=pecas[pecaSelecionada].cor){
        movimentos[5][0]= x-1;
        movimentos[5][1]= y-1;
        movimentos[5][2]= 2;
      }
    }
    if(y-1>=0){
      if(tabuleiro[x][y-1]==-1){
        movimentos[6][0]= x;
        movimentos[6][1]= y-1;
        movimentos[6][2]= 1;
      }
      else if(pecas[tabuleiro[x][y-1]].cor!=pecas[pecaSelecionada].cor){
        movimentos[6][0]= x;
        movimentos[6][1]= y-1;
        movimentos[6][2]= 2;
      }
    }
    if(x<7 && y-1>=0){
      if(tabuleiro[x+1][y-1]==-1){
        movimentos[7][0]= x+1;
        movimentos[7][1]= y-1;
        movimentos[7][2]= 1;
      }
      else if(pecas[tabuleiro[x+1][y-1]].cor!=pecas[pecaSelecionada].cor){
        movimentos[7][0]= x+1;
        movimentos[7][1]= y-1;
        movimentos[7][2]= 2;
      }
    }
  }
  if(nome=='r'){
    int contador=1;
    int tempX = x;
    int tempY = y;
    while(tempX<7 && tempY<7){
      tempX++;tempY++;
      if(tabuleiro[tempX][tempY]==-1){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[tempX][tempY]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
    tempX = x;
    tempY = y;
    while(tempX-1>=0 && tempY<7){
      tempY++;tempX--;
      if(tabuleiro[tempX][tempY]==-1){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[tempX][tempY]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
    tempX = x;
    tempY = y;
    while(tempX-1>=0 && tempY-1>=0){
      tempX--; tempY--;
      if(tabuleiro[tempX][tempY]==-1){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[tempX][tempY]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
    tempX = x;
    tempY = y;
    while(tempY-1>=0 && tempX<7){
      tempY--;tempX++;
      if(tabuleiro[tempX][tempY]==-1){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[tempX][tempY]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
    tempX = x;
    tempY = y;
    while(tempX<7){
      tempX++;
      if(tabuleiro[tempX][y]==-1){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= y;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[tempX][y]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= y;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
    tempX = x;
    tempY = y;
    while(tempY<7){
      tempY++;
      if(tabuleiro[x][tempY]==-1){
        movimentos[contador][0]= x;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[x][tempY]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= x;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
    tempX = x;
    tempY = y;
    while(tempX-1>=0){
      tempX--;
      if(tabuleiro[tempX][y]==-1){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= y;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[tempX][y]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= tempX;
        movimentos[contador][1]= y;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
    tempX = x;
    tempY = y;
    while(tempY-1>=0){
      tempY--;
      if(tabuleiro[x][tempY]==-1){
        movimentos[contador][0]= x;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 1;
        contador++;
      }
      else if(pecas[tabuleiro[x][tempY]].cor!=pecas[pecaSelecionada].cor){
        movimentos[contador][0]= x;
        movimentos[contador][1]= tempY;
        movimentos[contador][2]= 2;
        contador++;
        break;
      }
      else{
        break;
      }
    }
  }
  return true;
}
