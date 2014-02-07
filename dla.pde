int w=400,h=400;
int w2=w/2,h2=h/2;

int[][] matrizCrecimiento = new int[w][h];
int px=0,py=0;


void setup()
{
  size(w,h);
  for(int i=0;i<w;i++)
  {
    for(int j=0;j<h;j++)
    {
      matrizCrecimiento[i][j]=0;
    }
  }
  matrizCrecimiento[w2][h2]=1;
}

void draw()
{
  background(127);
  //Posicion particula de salida
  switch(floor(random(5)))
  {
    case 1:
      px=floor(random(h));
      py=0;
      //matrizCrecimiento[px][py]=1;
      break;
    case 2:
      px=0;
      py=floor(random(w));
      //matrizCrecimiento[px][py]=1;
      break;
    case 3:
      px=floor(random(h));
      py=w-1;
      //matrizCrecimiento[px][py]=1;
      break;
    case 4:
      px=h-1;
      py=floor(random(w));
      //matrizCrecimiento[px][py]=1;
      break;
  }
  
  //Pinta matriz
  for(int i=0;i<w;i++)
  {
    for(int j=0;j<h;j++)
    {
      if(matrizCrecimiento[i][j]==1)
      {
        stroke(255);
        point(i,j);
      }
    }
  }
  
  
 
  
}


