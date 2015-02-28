
size(800,800);
background(255);
int b=0;
//
//for(int i=0;i<255;i++){
//  stroke(i);
//  line(i,0,i,height);
//}


for(int i=0; i<1000; i++){
  stroke(map(i,0,height,253,21), map(i,0,height,189,155), map(i,0,height,255,16));
  line(0,i,width,i);
}

