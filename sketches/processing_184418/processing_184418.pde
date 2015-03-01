
/*-----------------------------------
Using For(Nested)

Created 5 February 2015
by Catherine Leee
-----------------------------------*/

size(500,500);
background(0,230,220);


//lines from center
for (int i = 0; i < 505; i = i+5) {
  for (int j = 0; j < 505; j = j+5){
    stroke(i/2,j/3,200);                        //color changing because of i and j
    line(250,250,i,j);                          //line
  }
}

//circle overlay
for(int k = 0; k < 550; k = k+20){
  for(int l = 0; l < 550; l = l+20){
    stroke(255,10);                            //white line color with opacity
   noFill(); 
    ellipse(250,250,k,l);                    
  }

}

