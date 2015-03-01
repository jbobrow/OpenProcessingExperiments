
//Gemma Galceran Kimura - Personatge que rebota

//Introducció de les variables

  int num_pilotes = 50;
  int[] sz = new int [num_pilotes];
  
  float[] posicionsX = new float[num_pilotes];
  float[] posicionsY = new float[num_pilotes];
  float[]velocitatsX = new float[num_pilotes];
  float[] velocitatsY = new float[num_pilotes];
  
  color [] color_pilota = new int [num_pilotes];
  color [] color_pilota2 = new int [num_pilotes];
  color [] color_pilota3 = new int [num_pilotes];

//Inicialització
  void setup()
  {
    size(750,750);
    //inicialitzem posicions i velocitats:
    for(int i= 0; i<num_pilotes; i++)
    {
      posicionsX [i] = width/2;
      posicionsY [i] = height/2;
      velocitatsX [i] = random(1,8);
      velocitatsY [i]= random(1,8);
      sz[i]= int(random(20,30));
      color_pilota[i] = color (int(random(100,255)),170,70);
      color_pilota2[i] = color (180,int(random(100,255)),60);
      color_pilota3[i] = color (60,140,int(random(40,160)));
    }
  }
  
// Inici del draw
  void draw()
  {
    background(#CACED1);
    for(int i= 0; i<num_pilotes; i++)
    {
      modificar_pos(i);
      comprovar_lim(i);
      dibuixar_personatge(i);     
    }
  }

// Paràmetres per modificar la posició i velocitat del personatge
  void modificar_pos(int _i)
  {
    posicionsX[_i]  += velocitatsX [_i];
    posicionsY[_i]  += velocitatsY [_i];
  }

//Paràmetres per comprovar límits
  void comprovar_lim(int _i)
  {
      //comprovar limits X
      if((posicionsX[_i] < sz[_i]/2-20)||(posicionsX[_i] > width-sz[_i]-35))
      {
        velocitatsX [_i] = -velocitatsX[_i] ;
      } 
      //comprovar limits Y
      if((posicionsY[_i] < sz[_i]/2)||(posicionsY[_i] >height-sz[_i]-35))
      {
        velocitatsY[_i]  = -velocitatsY[_i] ;
      } 
  }

//Dibuix del personatge
  void dibuixar_personatge(int _i)
  {
        noStroke();     
        //Cos
        fill(color_pilota[_i]);
        ellipse(posicionsX[_i]+20,posicionsY[_i]-3,sz[_i]-6,sz[_i]-5.8);
        ellipse(posicionsX[_i]+40,posicionsY[_i]-3,sz[_i]-6,sz[_i]-5.8);
        
        
        fill(color_pilota2[_i]);
        ellipse(posicionsX[_i]+30,posicionsY[_i]+36,sz[_i]+34,sz[_i]+28);
        arc(posicionsX[_i]+30,posicionsY[_i]+35.54,sz[_i]+34,sz[_i]+44,-PI,0);
        
        //Panxa
        fill(color_pilota3[_i]);
        ellipse(posicionsX[_i]+30,posicionsY[_i]+38,sz[_i]+26,sz[_i]+24);
  
        //ulls blancs
        ellipse(posicionsX[_i]+24,posicionsY[_i]+8,sz[_i]-17,sz[_i]-17);
        ellipse(posicionsX[_i]+36,posicionsY[_i]+8,sz[_i]-17,sz[_i]-17);
        
        //iris negre
        fill(color_pilota[_i]);
        ellipse(posicionsX[_i]+24,posicionsY[_i]+8,sz[_i]-20,sz[_i]-20);
        ellipse(posicionsX[_i]+36,posicionsY[_i]+8,sz[_i]-20,sz[_i]-20);
        

  }
