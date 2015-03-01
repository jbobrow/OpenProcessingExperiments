
//Create a composition with a series of lines and ellipses. Use an Ã�ï¿½Ã�Â¢Ã�Â¯Ã�Â¿Ã�Â½Ã�Â¯Ã�Â¿Ã�Â½if structureÃ�ï¿½Ã�Â¢Ã�Â¯Ã�Â¿Ã�Â½Ã�Â¯Ã�Â¿Ã�Â½ to select which lines of code to run and which to skip.//
size(600,400);
//if you change the value you can see a different image!
tatooine = 2;

background(255,150,30);
if(tatooine==1){
    stroke(255);
    for (int i=100; i<600; i+=60)
    {
      noStroke();
      fill(i,i/2,0);
      ellipse(i-50,200,i/10,i/10);
     rect(i-50,200,i/10,i/10);
     triangle(i-50,200,i/10,i/10,50,50);
    }
}

else
{
  for (int i=600; i>100; i-=60)
    {
      noStroke();
      fill(i,i/2,0);
      ellipse(i+50,200,i*2,i*2);
     rect(i+50,200,i/10,i/10);
     
    }
}


