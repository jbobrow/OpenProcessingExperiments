
void setup() {
size(300,300);
smooth();
}
//float=decimal value, initial position of y and integer i
float y =0.0;
float i=0.0;
void draw() {

  background(204,204,100);
 

     rect (i+10,100,80,80);
     fill(204,102,149);
      //if y value is greater than 300, y value is 0
    if (y>300){
    y=0;
  }
    
   //if integer i is greater than 300, i is 0, in all other cases i moves at a rate of +30
  if (i>300){
    i=0;
  }else{
    i+=50
    ;
  }
    
  if (i>300){
    i=0;
  }else{
    i+=50;
  }
  
}

