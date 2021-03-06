import gifAnimation.*;

int w=200, h=200;
int w2=w/2, h2=h/2;

int[][] matrizCrecimiento = new int[w][h];
int px=0, py=0;
int lado=1;
int agregacion=0;
int nuevaParticula=0;
//Pintado matriz
boolean pintaFrame=true;

//Generador de gifs
boolean generaGif=true;
int gifFrameRate=50;
int frameCounter=0;
GifMaker gifExport;

public void setup()
{
  if ((generaGif==true)&&(pintaFrame==true))
  {
    gifExport = new GifMaker(this, "examples/dlaGIF.gif");
    gifExport.setRepeat(1);  
    gifExport.setTransparent(255, 255, 255);
  }

  size(w, h);
  for (int i=0;i<w;i++)
  {
    for (int j=0;j<h;j++)
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

  while (agregacion==0)
  {
    if (nuevaParticula==0)
    {
      switch(floor(random(5)))
      {
      case 1:
        px=floor(random(w/2-lado, w/2+lado));
        py=h/2-lado;
        //matrizCrecimiento[px][py]=1;
        break;
      case 2:
        px=w/2-lado;
        py=floor(random(h/2-lado, h/2+lado));
        //matrizCrecimiento[px][py]=1;
        break;
      case 3:
        px=floor(random(w/2-lado, w/2+lado));
        py=h/2+lado;
        //matrizCrecimiento[px][py]=1;
        break;
      case 4:
        px=w/2+lado;
        py=floor(random(h/2-lado, h/2+lado));
        //matrizCrecimiento[px][py]=1;
        break;
      }
      nuevaParticula=1;
    }

    if ((px>0)&&(py>0)&&(px<w-1)&&(py<h-1))
    {
      for (int i=px-1;i<=px+1;i++)
      {
        for (int j=py-1;j<=py+1;j++)
        {
          if (matrizCrecimiento[i][j]==1)
          {
            agregacion=1;
            nuevaParticula=0; 
            matrizCrecimiento[px][py]=1;
          }
        }
      }
    }

    switch(floor(random(5)))
    {
    case 1:
      px++;
      break;
    case 2:
      px--;
      break;
    case 3:
      py++;
      break;
    case 4:
      py--;
      break;
    }

    if ((px>w2+lado)||(px<w2-lado)||(py>h2+lado)||(py<h2-lado))
      nuevaParticula=0;
  }

  //Resetea generacion de particulas
  agregacion=0;  

  //Pinta matriz
  if (pintaFrame==true)
  {
    pintaMatriz(matrizCrecimiento);
    if (generaGif==true)
    {
      if (frameCounter==gifFrameRate)
      {
        gifExport.setDelay(1);
        gifExport.addFrame();
        frameCounter=0;
      }
      frameCounter++;
    }
  }

  //Controla radio(lado) y salida  
  if (calculaDistancia(px, py, w2, h2)>=(lado-10))
  {
    lado++;
    if (lado==(h/2-5))
    {
      println("Fin!");
      //saveFrame("dla1.png");
      if ((generaGif==true)&&(pintaFrame==true))
      {
        gifExport.finish();
      }
      exit();
    }
  }
}

