


//creat loop
//for(int i=0;i<width;i+=15){
//for(int j=0;j<height;j+=15)
//
//rect(i,j,10,10);
//
//
//
//}


size(800,600);
background(255);



for(int i=0;i<width;i+=5){
  
float colorValue=map(i,0,0,125,255);//map(value, low1, high1, low2, high2)
ellipse(i,i,i,i);
fill(i,i,123);
}

for(int j=0;j<800;j+=5){
noFill();
ellipse(400,300,j,j);
}







