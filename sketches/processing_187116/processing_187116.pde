
int option = 0;

void setup(){
  size (640,480);
  strokeWeight(.5);
}

void draw(){
  background(255);
if (option == 0){
    for(int i = 50; i < width -50 ; i=i+ 20){
    for(int j = 50; j < height-20; j=j +20){
     line(i,j,width/2,height/2);
}
}
}

if (option == 1){
  for(int j = 50; j < height-50; j=j +7){
  for(int i =50; i < width-50; i=i +7){
    line(i,j,i+10,j+10);
    line(i,j+10,i+10,j);
}
}
}
  
if (option == 2){
    for(int i = 50; i < width -50 ; i=i+ 20){
    for(int j = 50; j < height-65; j=j +20){
      fill(i/3,j/3,20,20);
      rect(i,j,40,40);
}
}
}

if (option == 3){
  for(int i = 50; i < width -50 ; i=i+ 20){
    for(int j = 50; j < height-20; j=j +20){
     line(i,j,width/2,height/2);
    }
  }
     for(int j = 50; j < height-50; j=j +7){
  for(int i =50; i < width-50; i=i +7){
    line(i,j,i+10,j+10);
    line(i,j+10,i+10,j);
  }
     }
    
for(int i = 50; i < width -50 ; i=i+ 20){
    for(int j = 50; j < height-65; j=j +20){
      fill(i/3,j/3,20,20);
      rect(i,j,40,40);
    }
}
}
}

void mousePressed() {
  option = option +1;
  option = option%4;
println(option);
}
