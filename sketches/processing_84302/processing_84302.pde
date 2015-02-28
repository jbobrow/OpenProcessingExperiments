
color bkColor = color(0,0,0);
int kk=0;
void setup() {  
  size( 500, 300);
  frameRate(30);
  background(bkColor);
  
}

void draw(){
float x, y, cre=0, cim=1;
int j = 0;
int k =0;
int period = 40;
float modsqr;
float x1, y1;
  kk++;
  
 cre = 0.0 + .1*cos(PI*kk/91);
 cim = 1+.1*sin(PI*kk/51);
//cre = cre + .0001* random(-500, 500);
//cim = cim+.0001*random(-500, 500);  
background(bkColor);
while( j <height+1){
for(int i=0; i<width; i++)  
  {   
      x = -1.5 + 3.0* i/width;
      y = 1.5 - 3.0* j/height;
      modsqr = x*x + y*y;
      stroke(255, 250, 0);
 		while ((k<period) && (modsqr<4.5)) {
			x1 = cre+(x*x-y*y);
                        y1 = 2*x*y + cim ;
			x = x1;
			y = y1;
			modsqr = x*x+y*y;
			k++;
		}
		 for(int ii=0; ii<period; ii++)  
      {   
        if (k==ii ) {
          //   stroke(colA[floor(k/2)]);
                  //  stroke(sqrt(ii)*40, sqrt(sqrt(ii))*100, 0.5*(200-sqrt(ii)*40));
         stroke(sqrt(ii)*40, 25, 0.5*(255-sqrt(ii)*40));
        }
      }
 
		k = 0;
       point(i,j); 
      //rect(kk+width/2 , kk+height/2, -kk+width/2 , -kk+height/2 );
      }
  j++;}

// fill(0);
//text("Elapsed time =   " + str(t2) + " secs", 10, 420);

//noLoop();
}





 


