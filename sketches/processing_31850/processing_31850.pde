
int yo = 0;
int bro = 10;
int ho = 10;

void setup(){
  size (500, 500);
  background (0, 0, 0);
}

void draw(){
  fill(250,250,250,10);
  noStroke();
        while(yo < 500){
        rect(yo,yo,bro,bro);
  bro = bro + 5;
  yo = yo + 5;
        }
        /*  while(yo > 0){
        rect(yo+500,yo+500,bro,bro);
  bro = bro - 5;
  yo = yo - 5;
        }
        */
     
  
  
}

