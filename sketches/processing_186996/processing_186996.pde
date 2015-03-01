
//loops




//int x;

//for(int i=0; i < 100; i++){
  //x = i%2;//01 pattern
  //if( x == 0);{
    //fill(255);
  //}
 //else {
   // fill(0);
 //}
 //rect(i*100, i*100);
  //x = i%3;//012 pattern
  //x = i%4;//0123 pattern
  //print(x);
//}


//void setup(){
size(1000,1000);


//void draw();{
for (int x = 0; x<width; x++){
  for (int y = 0; y<height; y++){
    fill(random(200),random(200),random(200),random(200));
  rect(x*50, y*50, random(-100.0), random(100.0));
  }
}
//}
//}

    


