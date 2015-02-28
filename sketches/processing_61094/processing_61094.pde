

void CompruebaChoque() {
  for (int i=0; i<nivel;i++)
      if (dist(meteorpos[0][i], meteorpos[1][i], posnave[0], posnave[1])<((navesize[1]+(0.8*meteorsize[1]))/2) && abs(meteorpos[0][i]-posnave[0])<(((0.8*navesize[0])+(0.4*meteorsize[0]))/2.5)) {
        colision=true;
        tiempofin=frameCount;
        choqueX=posnave[0];
        choqueY=posnave[1];
        explosion.play();
      }
  }

