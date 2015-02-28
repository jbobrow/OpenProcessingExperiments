
int growth;

void setup(){
   
  size(500, 500);
  growth = 0;
  
 for(int pos = 0; pos < 500; pos += 100){ //i++ is the same as i = i +1; and i+=100 is the same as i = i +100
  growth = growth + 20;
   ellipse(250, pos, growth, growth);
   ellipse(pos, 250, (120-growth), (120-growth));

 } 
 
}

void draw (){
}
