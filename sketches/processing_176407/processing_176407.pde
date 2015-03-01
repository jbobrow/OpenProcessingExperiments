
size(400, 400);                 //
background(255,255,255);            //
noStroke();                 //
int p = 0;                  //
for(int y = 0; y <= 400; y += 40) {     //
    for(int x = 0; x <= 400; x += 40) {
        p ++;   //
        fill(p*2,p*2,p*2+16);
        if(p % 2 == 0){         //p
            rect(x, y, 40, 40); //
            if(p == 74){            //p         
                rect(x, y, 40, 40); //
            }
             
            if(p == 26){            //
                
                rect(x, y, 40, 40); //
            }
        }
    }
}
