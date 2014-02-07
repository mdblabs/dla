int w=400,h=400;
int sx=w/2,sy=h/2;
int px,py;
int cr=255,cg=10,cb=100;

int[][] matriz = new int[w][h];
int[][] matrizSemillas = new int[w][h];

void setup()
{
  size(w,h);
  for(int i=0;i<w;i++)
  {
    for(int j=0;j<h;j++)
    {
      matriz[i][j]=0;
      matrizSemillas[i][j]=0;
    }
  }
  matrizSemillas[sx][sy]=1;
}




void draw()
{


  
  for(int i=0;i<100;i++)
  {
    px=int(random(w));
    py=int(random(h));
    matriz[px][py]=1;
  }
 
  for(int i=0;i<w;i++)
  {
    for(int j=0;j<h;j++)
    {
      if(matriz[i][j]==1)
      {
        //stroke(255,0,255,255);
        //point(i,j);
        for(int k=0;k<w;k++)
        {
          for(int l=0;l<h;l++)
          {
            if(matrizSemillas[k][l]==2)
            {
              if(calculaDistancia(k,l,i,j)<=15)
              {
                matrizSemillas[i][j]=1;
              }
            }
          }
        }
      }      
    }
  }
  
  for(int i=0;i<w;i++)
  {
    for(int j=0;j<h;j++)
    {
      if(matrizSemillas[i][j]==1)
      {        
        fill(cr,cg,cb,20);       
        ellipse(i,j,5,5);
        matrizSemillas[i][j]++;
      }
      //matriz[i][j]=0;
      
    }
  }
  
}

float calculaDistancia(int x1,int y1,int x2,int y2)
{
  return(sqrt(pow(abs(x1-x2),2)+pow(abs(y1-y2),2)));

}
