

int option = 0;
void setup(){
    size(640,480);
    strokeWeight(.5);
}

void draw(){
    background(255); 
    if(option == 0){
      for(int i = 50; i < width - 50; i = i+20){
        for(int j = 50; j < height-50; j = j+20){
            fill(i,j,40,20);
            ellipse(i,j,40,40);
        }
      }
  } 
  if(option == 1){
    for(int i = 50; i < width - 50; i = i+20){
      for(int j = 50; j < height-50; j = j+20){
          line(i,j,width/2, height/2);
          }
        }
      }


if(option == 2) {
  for(int j = 50; j < height-50; j = j + 20 ){
    for(int i = 50; i < width-50; i = i+ 20){
  line(i,j,i+10,j+10);
  line(i,j+10,i+10,j);
          }
        }

      }
    
}  
  
void mousePressed(){
  option = option +1;
    if(option == 3){
      option = 0;
    }
  println(option);
  
  
}
      
 /*   


*/

  


