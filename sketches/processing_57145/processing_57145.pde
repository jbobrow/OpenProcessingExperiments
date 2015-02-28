



int option = 1;

void setup() {

size(600, 600);

smooth();

}


void draw() {

background(85,22,90);

if (option == 1) {


for (int k=0; // variable


    k< width;

    k+=30) { // variable 30


    for (int h=0;


    h<height; //alto

    h+=30) {


    fill (k,h,10); // color


    rect (k+5,h+5,50,20);




    }


 }



} 




else if (option == 2) {


// Option 2: Perspective

for (int k=0; //  variable 0

   k< width;

    k+=40) {  
      
   
    for (int h=0;

    h<height; 

    h+=40) {


    fill (k,h,85); // color

    rect (k+20,h+20,20,20);

    }


 }


} 


else if (option == 3) {

for (int k=0; 

    k< width;

    k+=25) {


    for (int h=0;

    h<height; 





    h+=25) {


    fill (k,h,20); // colores

    rect (k+10,h+10,110,110);


    }


 }



} 



else if (option == 4) {

// Option 4: Rotating arcs


for (int k= 40; k <= width-40; k += 60) {


for (int h = 50; h <= height-50; h+=60) {



fill (k,h,24); 


rect(k, h, 60, 60);


}


}


} 



else if (option == 5) {

// Option 5: Groups of fiv


for (int k = 100; k <= width-100; k += 50) {


for (int h = 100; h <= height-100; h+=50) {

fill (k,h,10); 

rect(k, h, 50, 50);


}



}


}





else if (option == 6) {

for (int k = 180; k <= width-180; k += 70) {

for (int h = 180; h <= height-180; h+=70) {

fill (k,h,50); 

rect (k, h, 20, 20);

}


}

}



else if (option == 7) {


for (int k = 100; k <= width-100; k += 30) {

for (int h = 100; h <= height-100; h+=30) {


fill (66,121,116); 


rect (k, h, 20, 20);


}


}


}


else if (option == 8) {


for (int k = 180; k <= width-180; k += 50) {

for (int h = 180; h <= height-180; h+=50) {

fill (k,h,20); 


rect(k, h, 30, 30);

}

}

}

else if (option == 9) {
for (int k = 200; k <= width-200; k += 60) {

for (int h = 200; h <= height-200; h+=60) {
  
fill (k,h,50);  

rect(k, h, 50, 80);


}


}

}


else if (option == 10) {

for (int k=0; 

    k< width;

    k+=50) { 

    for (int h=0;

    h<height; 

    h+=50) {

    fill (k,h,90); 

 rect (k+5,h+5,10,10);

    }

 }

}

}



void mousePressed() {


option++;



if (option > 10) option = 1;



}
