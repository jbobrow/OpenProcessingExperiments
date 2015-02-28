
void setup(){
smooth();
size(400,400);
background(240); //very very light gray
}

float count= 0;
float num= 25; //set number of rectangles


void draw(){
  if(count<num){
    if(count % 2==0){//first pattern (vertical)
    rectMode(CENTER);
      rect(count*width/num,height/2,width/num,height);
    }
    else{//second pattern (horizontal)
      rect(width/2,count*height/num,width,height/num);
    }
  }
  
   if(random(100)>60){ //probability of first color
    fill(0,0,255,95);} //transparent blue
   else{ 
    fill(150,95); //transparent light gray
    
   if(random(100)>80){ //probability of second color
   fill(0,150,50,95);} //transparnt green
   else{
     fill(150,95); //transparent light gray (again)
   }
    
   } 
   count++;
}



