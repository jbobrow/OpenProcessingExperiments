
float value;
int c;
boolean i = false;
boolean value1 = false;
int mc;

void setup(){
  size(600, 600);
  background(0);
  value = 120;
  c = 254;
  mc = 1;
}

void draw(){


 fill(mc);
  noStroke();
  ellipse(mouseX + 30, pmouseY, value, value);
  fill(181, 100, c, 5);
  rect(0, 0, 600, 600);


  if(value == 121 || value == 5){
  value1 = !value1;
  
  }
    
  if(!value1){
    value = value - 1;
    
    } 
    
    else{
      value = value + 1;
    }
  
  if (c==0 || c==255){ 
    i = !i;
  }
    
  if(!i){
   --c;
  }
   else{
     ++c;
   }
  
  println(value);
    
  
}

void mouseOut() {

  background(0);

}

void mouseClicked(){
  
  value = 480;
  
   if(value == 480 || value == 121){
  value1 = !value1;
  
  }
    
  if(!value1){
    value = value - 1;
    
    } 
    
    else{
      value = value + 1;
    }
    
     if (mouseButton == RIGHT) {

    value = 120;
    
      if(value == 119 || value == 5){
  value1 = !value1;
  
  }
    
  if(!value1){
    value = value - 1;
    
    } 
    
    else{
      value = value + 1;
    }

     }
   }


void mouseDragged(){

  mc = 255;

  }

void mousePressed(){
  
  value = 120;
  mc = 1;
  
   if(value == 121 || value == 5){
  value1 = !value1;
  
  }
    
  if(!value1){
    value = value - 1;
    
    } 
    
    else{
      value = value + 1;
    }
}
