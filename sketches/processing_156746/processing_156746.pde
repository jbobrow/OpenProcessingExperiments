
int diam=100;

void setup(){
 size(700,700);
 
 
}

  void draw(){
    
    background (243, 214, 112);

  for(int x=diam; x<height/2;x++){
    if(dist(mouseX, mouseY, x, height/2)<diam/2){
     fill(253, 5, 151); 
    } else { 
     fill(43, 241, 239); 
    }
    ellipse(x,height/2, diam*3, diam*4);
     ellipse(x,height/4, diam/4, diam);
      ellipse(x,height/5+x, diam, diam*7);
       ellipse(x*2,height/6+ x, diam+2, diam);
        ellipse(x*.5,height/7+ height*2, diam*9, diam);
         ellipse(x*2,height/8+x, diam, diam);
          ellipse(x,height/.5, diam, diam);
           ellipse(x/2,height, diam, diam);
            ellipse(x,height, diam*5, diam*5);
            ellipse(x,height/2+x, diam*5, diam*5);
            ellipse(x*4,height/2+x*2, diam*5, diam*5);
            ellipse(x/2,height*2+x*2, diam*5, diam*5);

  }
  
}


