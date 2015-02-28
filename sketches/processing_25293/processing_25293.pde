
/////////////////////////////////////////////////////////  

/// Written by Angela Blachnitzky, 18th February 2011 ///  

/////////////////////////////////////////////////////////  

   

int form1 = 500/6;  

int form2 = 500/12;  

   

void setup(){  

  size(500,500);  

  background(255);  

  stroke(0);  

     

  for(int i = 0; i < width/form1; i++){  

   for(int j = 0; j < height/form1; j++){  

     fill(255);  

     smooth();  

     noFill();  

     bezier(i*form1, j*form1+form1, i*form1+form1/5-random(1,8), j*form1+form1/6-random(1,8), i*form1+form1/9+random(1,8), j*form1+form1/2+random(1,8), i*form1+form1, j*form1);  

     }  

     }  

        

   for(int k = 0; k < width/form2; k=k+2){  

    for(int l = 0; l < height/form2; l=l+2){  

     fill(255,60,30);  

     smooth();  

     quad(k*form2, l*form2, k*form2+random(1,5), l*form2+random(1,3), k*form2+form2, l*form2+form2, k*form2+form2-random(1,5), l*form2+form2+random(3,7));  

      }  

      }  

             

   for(int k = 1; k < width/form2; k=k+9){  

    for(int l = 1; l < height/form2; l=l+5){  

     fill(255,30,90);  

     smooth();  

     quad(k*form2-random(0,6), l*form2, k*form2+random(0,6), l*form2+random(0,3), k*form2+form2, l*form2+form2, k*form2+form2-random(0,3), l*form2+form2+random(0,3));  

      }  

      }  

} 


