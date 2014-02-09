float calculaDistancia(int x1,int y1,int x2,int y2)
{
  return(sqrt(pow(abs(x1-x2),2)+pow(abs(y1-y2),2)));

}

void pintaMatriz (int[][] matriz)
{  
  for(int i=0;i<matriz.length;i++)
    {
      for(int j=0;j<matriz[0].length;j++)
      {
        if(matriz[i][j]==1)
        {
          stroke(255);
          point(i,j);
          //matrizCrecimiento[i][j]=0;
        }
      }
    }
}
