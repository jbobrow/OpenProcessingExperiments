
//Manuela Kind, Project #1
//Fall 2011, CMU Pittsburgh PA


//---------description------------
//type in any word or sentence, and 
//see how it transfers into a playful
//pattern...
//----------variables-------------

float w, h;

//------------links---------------

PImage  A,
        B,
        C,
        D,
        E,
        F,
        G,
        H,
        I,
        J,
        K,
        L,
        M,
        N,
        O,
        P,
        Q,
        R,
        S,
        T,
        U,
        V,
        W,
        X,
        Y,
        Z;

//-------------setup--------------

void setup()
{
  size (500,500);
  background (180,225,160);
  smooth();

//load images

  A = loadImage("A.png");
  B = loadImage("B.png");
  C = loadImage("C.png");
  D = loadImage("D.png");
  E = loadImage("E.png");
  F = loadImage("F.png");
  G = loadImage("G.png");
  H = loadImage("H.png");
  I = loadImage("I.png");
  J = loadImage("J.png");
  K = loadImage("K.png");
  L = loadImage("L.png");
  M = loadImage("M.png");
  N = loadImage("N.png");
  O = loadImage("O.png");
  P = loadImage("P.png");
  Q = loadImage("Q.png");
  R = loadImage("R.png");
  S = loadImage("S.png");
  T = loadImage("T.png");
  U = loadImage("U.png");
  V = loadImage("V.png");
  W = loadImage("W.png");
  X = loadImage("X.png");
  Y = loadImage("Y.png");
  Z = loadImage("Z.png");


}

//--------------draw--------------

void draw()
{
  imageMode(CENTER);
}

//----------keyPressed--------------

void keyPressed()
{ 
  w = random(50, 350);
  h = w;


  //----  
  if (key == 'A' || key == 'a')
    {
      image(A,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }

  //----  
  else if (key == 'B' || key == 'b')
    {
    image(B,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
   }
  //----  
  else if (key == 'C' || key == 'c')
    {
    image(C,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'D' || key == 'd')
    {
    image(D,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'E' || key == 'e')
    {
    image(E,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'F' || key == 'f')
    {
    image(F,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'G' || key == 'g')
    {
    image(G,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'H' || key == 'h')
    {
    image(H,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'I' || key == 'i')
    {
    image(I,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'J' || key == 'j')
    {
    image(J,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'K' || key == 'k')
    {
    image(K,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'L' || key == 'l')
    {
    image(L,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'M' || key == 'm')
    {
    image(M,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'N' || key == 'n')
    {
    image(N,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'O' || key == 'o')
    {
    image(O,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  else if (key == 'P' || key == 'p')
    {
    image(P,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'Q' || key == 'q')
    {
    image(Q,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'R' || key == 'r')
    {
    image(R,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'S' || key == 's')
    {
    image(S,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'T' || key == 't')
    {
    image(T,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'U' || key == 'u')
    {
    image(U,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'V' || key == 'v')
    {
    image(V,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'W' || key == 'w')
    {
    image(W,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'X' || key == 'x')
    {
    image(X,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'Y' || key == 'y')
    {
    image(Y,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }
  //----  
  else if (key == 'Z' || key == 'z')
    {
    image(Z,random(width/10, width*0.9), random(height/10, height*0.9),w,h);    
    }

}


