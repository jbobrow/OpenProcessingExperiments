
int colr = 0;
boolean apple  = true;
int[] arr = new int[3];

void setup(){
  size(600,600);
}

void draw(){
background(0);
 if(apple == true){
   colr ++;}
   else
   {
     colr--;
   }
 if (colr == 255){
   apple = false;
 }
 if (colr==0){
   apple = true;
 }
 
 noFill();
 stroke(colr);
 strokeWeight(random(0,6));
 
	for (int i = 0; i <3; i++)
	{
	
		for (int j = 0; j < 3; j++)
		{

//  rotateY(radians(random(360)));

  rect(i,j,random(600),random(600));
}
}

}



