

int rectSize = 0;
int xwidth= 20;
int yheight= 0;
int startx= 50;
int starty= 50;



void setup() {
  size(500,500);
  smooth();
  background(255);
}


void rect1(){
  stroke(20);
  fill(20);
  rectMode(CENTER);
  rect(startx-50,10*starty,xwidth,yheight);
  yheight = yheight + 2; 
  
  fill(255);
  stroke(255);
  rectMode(CENTER);
  rect(startx-50,16*starty,xwidth,yheight);
  yheight = yheight + 2;  
}  

void rect1a(){
  stroke(30);
  fill(30);
  rectMode(CENTER);
  rect(startx-50,500,xwidth,yheight);
  yheight = yheight - 2; 
  
}  


void rect2(){
  stroke(40);
  fill(40);
  rectMode(CENTER);
  rect(1*startx,9*starty,xwidth,yheight);
  yheight = yheight + 2;  
  
  fill(255);
  stroke(255);
  rectMode(CENTER);
  rect(startx,30*starty,xwidth,yheight);
  yheight = yheight + 2; 
}  


void rect3(){
  stroke(50);
  fill(50);
  rectMode(CENTER);
  rect(2*startx,15*starty,xwidth,yheight);
  yheight = yheight + 2;  
  
  fill(255);
  stroke(255);
  rectMode(CENTER);
  rect(2*startx,25*starty,xwidth,yheight);
  yheight = yheight + 2; 
}  
 
 
 
 void rect4(){
  stroke(60);
  fill(60);
  rectMode(CENTER);
  rect(3*startx,7*starty,xwidth,yheight);
  yheight = yheight + 2; 
  
  fill(255);
  stroke(255);
  rectMode(CENTER);
  rect(3*startx,12*starty,xwidth,yheight);
  yheight = yheight + 2; 
}  


void rect5(){
  stroke(70);
  fill(70);
  rectMode(CENTER);
  rect(4*startx,6*starty,xwidth,yheight);
  yheight = yheight + 2; 
 
  fill(255);
  stroke(255);
  rectMode(CENTER);
  rect(4*startx,43*starty,xwidth,yheight);
  yheight = yheight + 2;  
}
 
 
void rect6(){
  stroke(80);
  fill(80);
  rectMode(CENTER);
  rect(5*startx,5*starty,xwidth,yheight);
  yheight = yheight + 2; 

  fill(255);
  stroke(255);
  rectMode(CENTER);
  rect(5*startx,36*starty,xwidth,yheight);
  yheight = yheight + 2;  

}
 
 
void rect7(){
  stroke(90);
  fill(90);
  rectMode(CENTER);
  rect(6*startx,4*starty,xwidth,rectSize);
  yheight = yheight + 2; 
  
  fill(255);
  stroke(255);
  rectMode(CENTER);
  rect(6*startx,20*starty,xwidth,yheight);
  yheight = yheight + 2;  
}


void rect8(){
  stroke(100);
  fill(100);
  rectMode(CENTER);
  rect(7*startx,3*starty,xwidth,yheight);
  yheight = yheight + 2; 
  
  fill(255);
  stroke(255);
  rectMode(CENTER);
  rect(7*startx,20*starty,xwidth,yheight);
  yheight = yheight + 2;  
}


void rect9(){
  stroke(110);
  fill(110);
  rectMode(CENTER);
  rect(8*startx,-2*starty,xwidth,rectSize);
  rectSize = rectSize + 2; 
  
  fill(255);
  stroke(255);
  rectMode(CENTER);
  rect(8*startx,20*starty,xwidth,yheight);
  yheight = yheight + 2;  
  
}



void rect10(){
  stroke(120);
  fill(120);
  rectMode(CENTER);
  rect(9*startx,1*starty,xwidth,yheight);
  yheight = yheight + 2; 
  
  fill(255);
  stroke(255);
  rectMode(CENTER);
  rect(9*startx,20*starty,xwidth,yheight);
  yheight = yheight + 2;  
  }
  


void rect11(){
  stroke(130);
  fill(130);
  rectMode(CENTER);
  rect(10*startx,starty,xwidth,yheight);
  yheight = yheight + 2; 
 
  fill(255);
  stroke(255);
  rectMode(CENTER);
  rect(10*startx,20*starty,xwidth,yheight);
  yheight = yheight + 2;  
  
}





void rect12(){
  stroke(22);
  fill(22);
  rectMode(CENTER);
  rect(300,300,rectSize,rectSize);
  rectSize = rectSize + 2; 
}
  
  
void rect13(){
  stroke(22);
  fill(22);
  rectMode(CENTER);   
  rect(200,200,rectSize,rectSize);
  rectSize = rectSize + 2;
}

void rect14(){
  stroke(222);
  fill(222);
  rectMode(CENTER);   
  rect(250,250,rectSize/2,rectSize/2);
  rectSize = rectSize + 2;
}

void rect19(){
  stroke(255);
  fill(255);
  rectMode(CENTER);   
  rect(350,150,rectSize/2,rectSize/2);
  rectSize = rectSize - 1;
}


void rect15(){
  stroke(255);
  fill(255);
  rectMode(CENTER);   
  rect(150,350,rectSize/2,rectSize/2);
  rectSize = rectSize - 1;
}


void rect20(){
  stroke(255);
  fill(255);
  rectMode(CENTER);   
  rect(500,500,rectSize/4,rectSize/4);
  rectSize = rectSize + 2;
}

void rect16(){
  stroke(255);
  fill(255);
  rectMode(CENTER);   
  rect(0,0,rectSize/4,rectSize/4);
  rectSize = rectSize + 2;
}

void rect17(){
  stroke(255);
  fill(255);
  rectMode(CENTER);   
  rect(0,500,rectSize/4,rectSize/4);
  rectSize = rectSize + 2;
}

void rect18(){
  stroke(255);
  fill(255);
  rectMode(CENTER);   
  rect(500,0,rectSize/3,rectSize/3);
  rectSize = rectSize + 2;
}

void rect21(){
  stroke(235);
  fill(235);
  rectMode(CENTER);   
  rect(0,800,rectSize,rectSize);
  rectSize = rectSize + 5;
}

void rect22(){
  stroke(255);
  fill(255);
  rectMode(CENTER);   
  rect(500,-1200,rectSize,rectSize);
  rectSize = rectSize + 1;
}




void draw() {
rect12();
rect13();
rect14();
rect15();
rect16();
rect17();
rect18();
rect19();
rect20();
rect21();
rect22();
delay(10);
rect1();
rect2();
rect3();
rect4();
rect5();
rect6();
rect7();
rect8();
rect9();
rect10();



}

