
size (500, 500);
background (255);
strokeWeight (1);
smooth ();

int SPACE=0;



for (int i=0; i<500-SPACE; i=i+40) {
  line(SPACE+i,SPACE, SPACE+500,SPACE - i);
    line(SPACE, SPACE+i,500-SPACE-i,SPACE);


}


                
                
