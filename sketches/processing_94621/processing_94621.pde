
float a;
float a1;
float count;
float c;
float c1;
float d;
float d1;
float d2;
float d3;
float thing;
float count2;
boolean that=false;
boolean daye;
float notherthing;
number1[] numbers1;
number2[] numbers2;
number3[] numbers3;

void setup() {
  size(700,600);
     c=minute();
       textAlign(CENTER);
    d=hour();
      a=second();
      numbers1= new number1[10];
     numbers2= new number2[100];   
     numbers3= new number3[100];
     
     for(int i=0; i<100; i++) {
       numbers2[i]= new number2(i);   
     numbers3[i]= new number3(i);
     }
      for(int k=0; k<10; k++) {
       numbers1[k]= new number1(k);
     }
     
     
    
       a=second();
    c=minute();
    d=hour();
    
  a1=a+c*60+d*sq(60);
}
















void draw() {
    background(90);
  
 if(mousePressed==true && that==false) {
   that=true;
 if(daye==true) {
   daye=false;
 } else if(daye==false) {
   daye=true;
 }
 } else if (mousePressed==false && that==true) {
   that=false;
 }
 

 
 
     
     
   a=second();
    c=minute();
    d=hour();
    if(count2>2) {
        a1=a+c*60+d*sq(60);
        count2=0;
        
    }
    
    
    
    
      
      


 count=count+1;
 notherthing=.016666666;
 count2=count2+notherthing;
 a1=a1+notherthing;
  
      c1=(a1/(24*sq(60)))*10*100*100;
     d1=floor(c1/(100*100));
     d2=floor(c1/(100)-d1*100);
     d3=c1-floor(c1/100)*100;
     
 
 
 
 
 
 
 fill(255);
translate(width/2,height/2);
  
 ellipse(0,0,800,800);
  if(daye==true) {
    fill(0);
    textSize(58);
    text(day(), 0,-20);
  
  }
 
textSize(12);
 
 
 
 
  for(int whatnow=0; whatnow<100; whatnow++) {
    fill(0);
       numbers2[whatnow].display(270);   
     numbers3[whatnow].display(290);
     }
      for(int whatif=0; whatif<10; whatif++) {
        fill(0);
       numbers1[whatif].display(250);
     }
     


 pushMatrix();
 rotate(2*PI*d1/10);
 line(0,-240,0,0);
 popMatrix();
 
  pushMatrix();

 rotate(2*PI*d3/100);
 line(0,-280,0,0);
 popMatrix();
 
  pushMatrix();

 rotate(2*PI*d2/100);
 line(0,-260,0,0);
 popMatrix();
 

   
 
}



class number1{
  int rot;
  
  number1(int rot1) {
    rot=rot1;
  }
  
  
  void display(float bring) {
       pushMatrix();
        rotate(PI*2*rot/10);
    translate(0,-bring);

    pushMatrix();
    rotate(-PI*2*rot/10);
    text(rot+1,0,0);
    popMatrix();
    popMatrix();
  }
  
}




class number2{
  int rot;
  
  number2(int rot1) {
    rot=rot1;
  }
  
  
  void display(float bring) {
    pushMatrix();
        rotate(PI*2*rot/100);
    translate(0,-bring);

    pushMatrix();
  
    rotate(-PI*2*rot/100);
    text(rot+1,0,0);
    popMatrix();
    popMatrix();
  }
  
}






class number3{
  int rot;
  
  number3(int rot1) {
    rot=rot1;
  }
  
  
  void display(float bring) {
    pushMatrix();
        rotate(PI*2*rot/100);
    translate(0,-bring);

    pushMatrix();
    rotate(-PI*2*rot/100);
    textAlign(CENTER);
    text(rot+1,0,0);
    popMatrix();
    popMatrix();
  }
  
}
  


