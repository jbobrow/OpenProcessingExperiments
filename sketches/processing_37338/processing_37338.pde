
int x;
int y;
int x1;
int y1;
int x2;
int y2;
color Red = color(255,0,0);
color Blue = color(0,0,255);
int[] circles = new int[3];
circles[0] = 50;
circles[1] = 150;
circles[2] = 250;
int[] clicked = new int[2];
clicked[0] = x;

color undefined;



void setup(){  //setup function called initially, only once
  size(300,300);
  background(255);  //set background white
  stroke(0);
  line(0,100,300,100);
  line(0,200,300,200);
  line(100,0,100,300);
  line(200,0,200,300);
}

void draw(){ 
  if(mousePressed){
    get(mouseX,mouseY);
    if(mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 100){
      x = 50;
      y = 50;
      //println("50,50");
    
    }
    else if(mouseX > 100 && mouseX < 200 && mouseY > 0 && mouseY < 100){
      x = 150;
      y = 50;
      //println("150,50");
    }
    else if(mouseX > 200 && mouseX < 300 && mouseY > 0 && mouseY < 100){
      x = 250;
      y = 50;
      //println("250,50");
    }  
    
    else if(mouseX > 0 && mouseX < 100 && mouseY > 100 && mouseY < 200){
      x = 50;
      y = 150;
      //println("50,150");
    }
    else if(mouseX > 100 && mouseX < 200 && mouseY > 100 && mouseY < 200){
      x = 150;
      y = 150;
      //println("150,150");
    }    
    else if(mouseX > 200 && mouseX < 300 && mouseY > 100 && mouseY < 200){
      x = 250;
      y = 150;
      //println("250,150");
    }    
    else if(mouseX > 0 && mouseX < 100 && mouseY > 200 && mouseY < 300){
      x = 50;
      y = 250;
      //println("50,250");
    } 
    else if(mouseX > 100 && mouseX < 200 && mouseY > 200 && mouseY < 300){
      x = 150;
      y = 250;
      //println("150,250");
    }       
    else if(mouseX > 200 && mouseX < 300 && mouseY > 200 && mouseY < 300){
      x = 250;
      y = 250;
      //println("250,250");
    }
      
  }
   else{
    x = 500;
    y = 500;
  }    


  void first();
  void second();
}

void calculation(){

}

void first(){
  x1 = x;
  y1 = y;
  fill(Red);
  ellipseMode(CENTER);
  ellipse(x1,y1,30,30);
  color undefined = get(x1, y1);
  
  
  if(undefined = Red){
    println("YES");

    void second();
  }
  else{
    println("NO");
  }
  
}

void second(){
    x2 = x;
    y2 = y;
  fill(Blue)
  ellipseMode(CENTER);
  ellipse(x2,y2,30,30);
}

                
                                                                                                                                                                                                                                                                                                                                                                
