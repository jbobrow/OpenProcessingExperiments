
int fheight,fwidth;
int xsquare,ysquare,l;
int GameOver;
PImage backg,ximg,imgGover,imgNgame,imgcomp,imgplayer;
int [] results;
int osize,xsize;
int turn;   //1 or 2
int computer;

void setup(){
  fwidth=950;fheight=650;
  size(950,650); 
 
  
 
  backg =  loadImage("background.jpg");
  ximg = loadImage("X.png");
  imgGover=loadImage("GameOver.png");
  imgNgame=loadImage("NewGame.png");
  imgcomp=loadImage("Computer.png");
  imgplayer=loadImage("player.png");
  strokeWeight(4);
  fill(246,230,14) ;
  results = new int[9];
  osize=70;
  xsize=70;
  turn=1; 
  computer=0; 
  for(int i=0;i<9;i++)
    results[i]=0;
  
  
  
  xsquare=90;
  ysquare=40;
  l=200;
  GameOver=0;
}


void draw(){
  
  //draw background
  image(backg,0,0,fwidth,fheight);
  image(imgNgame,700,500,200,100);
  if (computer==1)
    image(imgcomp,700,300,200,100);  
  else
    image(imgplayer,700,300,200,100); 
  
  
  // draw horizonal lines
  line(xsquare,ysquare+l,xsquare+3*l,ysquare+l);
  line(xsquare,ysquare+2*l,xsquare+3*l,ysquare+2*l);
  
  //draw vertical lines
  line(xsquare+l,ysquare,xsquare+l,ysquare+3*l);
  line(xsquare+2*l,ysquare,xsquare+2*l,ysquare+3*l);
  
  
  
  
  
  int index=0;
  for (int i=0;i<3;i++){
    for (int j=0;j<3;j++){      
       if (results[index]==1) 
          ellipse(xsquare+ j*l+l/2, ysquare+i*l+l/2,osize,osize);
       else if (results[index]==2) 
          image(ximg,xsquare+j*l+ (l-xsize)/2, ysquare+ i*l + (l-xsize)/2,xsize,xsize);  
       
       index ++;   
    }
        
  }
  
  if (GameOver==2){
     
     image(ximg,800,50,50,50); 
     image(imgGover,100,100,600,600);
    
  }else if (GameOver==1){
      ellipse(800,50,50,50);
      image(imgGover,100,100,600,600);
  }
  
  
}


void mouseClicked() {
         int index=0;
         //image(imgNgame,700,500,200,100);
         if (mouseX > 700 && mouseX<900 && mouseY > 500 && mouseY<600){
           for(int i=0;i<9;i++)
                results[i]=0;
           GameOver=0;
           
           return; 
         }
         
         //image(imgcomp,700,300,200,100); 
         if (mouseX > 700 && mouseX<900 && mouseY > 300 && mouseY<400){
            if (computer==0) computer=1; else computer=0; 
           
           
         }
         
         
         if (GameOver==0){
           for (int i=0;i<3;i++){
              for (int j=0;j<3;j++){        
                 if (mouseX > xsquare+j*l && mouseX<xsquare+(j+1)*l && mouseY > ysquare + i*l && mouseY<ysquare+(i+1)*l && results[index]==0){
                    results[index]=turn; 
                    if (turn==1) turn=2; else turn=1;  
                     detectwining();
                     if (computer==1) ComputerPlay(turn);
                     return;         
                 }
                 index++;
              }
           }  
         }       
}

void detectwining(){
   for (int i=0;i<9;i++){
      if (i==0 || i==3 || i==6){
        if (results[i]==results[i+1]&& results[i]==results[i+2]&&results[i]!=0){
            declareWin(results[i]);
            return;
         }
        
      }
          
      if (i<3){                  
         if (results[i]==results[i+3] && results[i]==results[i+6]&&results[i]!=0){ 
             declareWin(results[i]);
            return;
         }
         
         if (results[0]==results[4]&& results[4]==results[8]&&results[0]!=0){
            declareWin(results[0]);
            return;
         } 
        
        
        if (results[2]==results[4]&& results[4]==results[6]&&results[2]!=0){
            declareWin(results[2]);
            return;
         }  
      }      
   }   
}


void declareWin(int i){
    if (i==1)
      GameOver=1;
    else
      GameOver=2;  
}

void ComputerPlay(int n){
  if (results[4]==0){
     results[4]=n;
    
  } else if (results[0]==0){
    results[0]=n;
       
  }else if (results[8]==0){
    results[8]=n;
       
  }else if (results[2]==0){
    results[2]=n;
         
  }else if (results[6]==0){
    results[6]=n;
       
  }else {
     for(int i=1;i<8;i++){
        if (results[i]==0) {
           results[i]=n; 
           break;
        }
     } 
  }  
  
  if (turn==1) turn=2; else turn=1;  
  detectwining();  
}




