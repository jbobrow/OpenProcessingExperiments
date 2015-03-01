
//Gemma Galceran Kimura - Pràctica individual

//Introducció de variables
  //Variables de les aranyes
  int num_aranyes = 4;
  float[] posY = new float [num_aranyes];
  float[] velY = new float [num_aranyes];

  // Variables boles de foc
  int num_foc = 2;
  float[][] posfocX = new float[num_aranyes][num_foc];
  float[][] posfocY = new float[num_aranyes][num_foc];
  float[][] velfocX = new float[num_aranyes][num_foc];
  float[][] velfocY = new float[num_aranyes][num_foc];
  
//Inicialització
void setup()
  {
    size(1000, 1000);
    //Inicialitzem posicions i velocitats:
    for (int i=0; i<num_aranyes; i++)
    {
      posY [i] = 25;
      velY [i] = random(1, 4); 
     
      for(int j= 0; j<num_foc; j++)
      {
        posfocX [i][j] = 200*(i+1);
        posfocY [i][j] = 700;
        velfocX [i][j] = random(1,3);
        velfocY [i][j]= random(1,3);
      }
    }
  }
  
  // Inici del draw
  void draw ()
  {
    //fons que es manté fixe
    background(100);
    
    fill(#F02727);
    textAlign(CENTER);
    textSize(32);
    text("- - - - - - -  Spider killer - - - - - - - " , width/2 ,50);
    textSize(15);
    text("Click on the spiders" , width/2 ,80);
    text("to keep them alive!!" , width/2 ,95);
    strokeWeight(3);
    stroke(#A01212);

    
    
    //Telaranyes
    noFill();
    strokeWeight(2);
    stroke(170);
    arc(0,0,80,80,0,TWO_PI-QUARTER_PI);
    arc(0,0,160,160,0,TWO_PI-QUARTER_PI);
    arc(0,0,240,240,0,TWO_PI-QUARTER_PI);
    arc(0,0,320,320,0,TWO_PI-QUARTER_PI);
    arc(0,0,400,400,0,TWO_PI-QUARTER_PI);
    arc(0,0,480,480,0,TWO_PI-QUARTER_PI);
    
    line(0,0,235,90);
    line(0,0,180,180);
    line(0,0,90,235);
    
    arc(width-1,0,120,120,-QUARTER_PI,PI);
    arc(width-1,0,240,240,-QUARTER_PI,PI);
    arc(width-1,0,360,360,-QUARTER_PI,PI);
    arc(width-1,0,480,480,-QUARTER_PI,PI);
    arc(width-1,0,600,600,-QUARTER_PI,PI);

    line(width,0,width-310,20);
    line(width,0,width-300,90);
    line(width,0,width-275,155);
    line(width,0,width-225,225);
    line(width,0,width-155,275);
    line(width,0,width-90,300);
    line(width,0,width-20,310);

    noStroke();
    
    //Barana
    fill(170);
    rect(0, 490, width, 20);
    rect(115, height/2, 20, height/2); 
    rect(240, height/2, 20, height/2); 
    rect(365, height/2, 20, height/2); 
    rect(490, height/2, 20, height/2); 
    rect(615, height/2, 20, height/2); 
    rect(740, height/2, 20, height/2); 
    rect(865, height/2, 20, height/2); 
  
    //Test de les plantes i tiges
    fill(#957144);
    beginShape();
    vertex(165, height);
    vertex(135, height-100);
    vertex(265, height-100);
    vertex(235, height);
    endShape();
  
    beginShape();
    vertex(365, height);
    vertex(335, height-100);
    vertex(465, height-100);
    vertex(435, height);
    endShape();
  
    beginShape();
    vertex(565, height);
    vertex(535, height-100);
    vertex(665, height-100);
    vertex(635, height);
    endShape();
    
    beginShape();
    vertex(765, height);
    vertex(735, height-100);
    vertex(865, height-100);
    vertex(835, height);
    endShape();
    
    //test
    fill(#5F4627);
    rect(135, height-125, 130, 25);
    rect(335, height-125, 130, 25);
    rect(535, height-125, 130, 25);
    rect(735, height-125, 130, 25);
    
    //tija
    fill(#44A535);
    rect(200-5, height-260, 10, 135);
    rect(400-5, height-260, 10, 135);
    rect(600-5, height-260, 10, 135);
    rect(800-5, height-260, 10, 135);
    
    //flor oberta
    arc(200,height-300,130,100,-QUARTER_PI,PI+QUARTER_PI);
    arc(400,height-300,130,100,-QUARTER_PI,PI+QUARTER_PI);
    arc(600,height-300,130,100,-QUARTER_PI,PI+QUARTER_PI);
    arc(800,height-300,130,100,-QUARTER_PI,PI+QUARTER_PI);
    
  
    noFill();
  
    for (int i=0; i<num_aranyes; i++)
    {   
        dibuix_aranya(i);
        comprovar_lim(i);
        modificar_posaranya(i);
        
        for (int j=0; j<num_foc; j++)
        {
          if (posY[i] == 700)
          {
            dibuix_foc(i,j);
            comprovar_lim(i,j);
            modificar_posbola(i,j);
            
          }
        }
    }  
  }
  
//MODIFICAR POSICIÓ I VELOCITAT  
  void modificar_posaranya(int _i)  //Paràmetres per modificar la posició i velocitat del personatge
  {
    posY[_i] += velY [_i];
  }
  
   void modificar_posbola(int _i, int _j)
  {
    posfocX[_i][_j]  += velfocX [_i][_j];
    posfocY[_i][_j]  += velfocY [_i][_j];
  }
  
//PARÀMETRES PER COMPROVAR LÍMITS
  void comprovar_lim(int _i)
    {
      //comprovar limits Y
      if (posY[_i] > 700) //l'aranya desapareix
      {
        posY [_i] = 700;
        velY [_i] = 0;    
      }
      if (posY[_i] == 700)
      {
        
        fill(#F02727);
        textSize(30);
        text("Nyam!" , 200*(_i+1) ,600);
        noFill();
        
        noStroke();
        fill(#44A535);
        //FLOR TANCADA
        ellipse(200*(_i+1), 700, 130,100);
        
        //DENTS DE LA FLOR QUAN ES TANCA
        fill(255);
        beginShape();
        vertex(200*(_i+1),700-50);
        vertex(200*(_i+1),700-30);
        vertex(200*(_i+1)-25,700-40);
        endShape();
        beginShape();
        vertex(200*(_i+1),700-30);
        vertex(200*(_i+1),700-10);
        vertex(200*(_i+1)+25,700-20);
        endShape();
        beginShape();
        vertex(200*(_i+1),700-10);
        vertex(200*(_i+1),700+10);
        vertex(200*(_i+1)-25,700);
        endShape();
        beginShape();
        vertex(200*(_i+1),700+10);
        vertex(200*(_i+1),700+30);
        vertex(200*(_i+1)+25,700+20);
        endShape();
        
      }
    }
    
  void comprovar_lim(int _i , int _j)
    {
      //comprovar limits X
      if((posfocX[_i][_j] < 5)||(posfocX[_i][_j] > width-5))
      {
        velfocX [_i][_j] = -velfocX[_i][_j] ;
      } 
      //comprovar limits Y
      if((posfocY[_i][_j] < 5)||(posfocY[_i][_j] >height-5))
      {
        velfocY[_i][_j]  = -velfocY[_i][_j] ;
      } 
    }
  
  //Dibuix de les aranyes
  void dibuix_aranya(int _i)
    {
      fill(0);
      ellipse(200*(_i+1), posY[_i], 70, 50);
      fill(255);
      ellipse(200*(_i+1)-18.5, posY[_i], 15, 13);
      ellipse(200*(_i+1)+18.5, posY[_i], 15, 13);
      fill(#981212);
      ellipse(200*(_i+1)-18.5, posY[_i], 4, 4);
      ellipse(200*(_i+1)+18.5, posY[_i], 4, 4);
     
      noFill();
      stroke(0);
      strokeWeight(3);
      arc(200*(_i+1)-40, posY[_i]-12.5,25,20,PI,TWO_PI);
      arc(200*(_i+1)-40, posY[_i],25,20,PI,TWO_PI);
      arc(200*(_i+1)-40, posY[_i]+12.5,25,20,PI,TWO_PI);
      arc(200*(_i+1)+40, posY[_i]-12.5,25,20,PI,TWO_PI);
      arc(200*(_i+1)+40, posY[_i],25,20,PI,TWO_PI);
      arc(200*(_i+1)+40, posY[_i]+12.5,25,20,PI,TWO_PI);
      
      strokeWeight(5);
      line(200*(_i+1), 0, 200*(_i+1), posY[_i]);
      strokeWeight(2);
      noStroke();
    }
    
  void dibuix_foc(int _i , int _j)
    {
    fill(#E57905);
    ellipse(posfocX[_i][_j],posfocY[_i][_j],35,45);
    fill(#FFCA08);
    ellipse(posfocX[_i][_j],posfocY[_i][_j]+5,15,25);
    }
  


  void mousePressed()
    {
      boolean sortir=false;
    
      for(int i=0; (i < num_aranyes) && (!sortir); i++)
      {
         if (mouseY < 680) //l'aranya rebota i torna a l'inici de la corda
           {
              if ( (mouseX > 200*(i+1)-25) && (mouseX < 200*(i+1)+25) && (mouseY > posY[i]-25) && (mouseY < posY[i]+25))
               {
                posY[i] = 25;
                velY [i] = random(1, 4);               
                sortir = true;
               }
           }
      }
    }


