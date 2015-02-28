
int P = -280;
int A = 420;
int T = -330;
int R1 = 250;
int R2 = -290;
int I = 300;
int C = -300;
int K = 600;


void setup(){
size(900,800);
background(255, 245, 220);
noStroke();
}

void draw (){
//P
background(255, 245, 220);
P = P+1;
P = min(0, P);
fill(245, 69, 69);          //red
rect(160+P, 230, 40, 300);  //P block 1
rect(200+P, 230, 100, 50);  //P block 2
rect(290+P, 230, 40, 150);  //P block 3
rect(330+P, 350, -170, 40); //P block 4


//A
A = A-1;
A = max(0, A);
fill(49, 255, 215);         //light blue
rect(210+A, 400, 40, 130);  //A block 1
rect(250+A, 400, 80, 35);   //A block 2
rect(330+A, 400, 40, 130);  //A block 3
rect(210+A, 460, 150, 30);  //A block 4


//T
T = T+1;
T = min(0, T);
fill(96, 255, 44);         //light green
rect(380+T, 230+T, 40, 300); //T block 1
rect(340+T, 360+T, 120, 30); // block 2


//R
R1 = R1-1;
R2 = R2+1;
R1 = max(0, R1);
R2 = min(0, R2);
fill(229, 77, 35);          //red 
rect(430+R1, 400+R2, 40, 130); //R1 & R2 block part 1
rect(470+R1, 400+R2, 50, 30); //R1 & R2 block part 2

//I
I = I-1;
I = max(0, I);
fill(122, 184, 247);       //blue  
rect(530+I, 330, 40, 200); //I

fill(250, 193, 35);        //yellow
rect(520+I, 240, 65, 65);  //Dot

//C
C = C+1;
C = min(C, 0);
fill(147, 39, 155);         //Purple
rect(580+C, 400+C, 40, 130); //C block 1
rect(580+C, 400+C, 80, 30); // C block 2
rect(580+C, 500+C, 80, 30); // C block 3

K = K+1;
K = min(K, 0);
fill(42, 121, 245);         //dark blue
rect(670+K, 230+K, 40, 300); //K block 1
rect(710+K, 360+K, 80, 20); // K block 2
rect(710+K, 385+K, 80, 20); // K block 3
rect(780+K, 230+K, 20, 150); // K block 3
rect(780+K, 385+K, 20, 145); // K block 3
}


