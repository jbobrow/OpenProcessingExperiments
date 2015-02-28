
/* GenInvaders
 Lifo Fernandez
 25 Julio 2009
 (Ispired on J. Tarbell's "invader fractal") */

int sise = 15; //pix size of each part
int Parts = 26; //ncols and nrows. now it works with odd an even numbers!;)  

int offset = 1;
int[]x = new int[Parts];
int[]y = new int[Parts];
int[]pos = new int[Parts];

int[]col = {
  0,255};//paints for de parts, (with more grays works very fine too)
int[]partcol = new int[Parts*Parts];

int j= 0;

float oddOrEven = Parts%2;

void setup(){
  size(390, 390 /*tri this to : Parts*sise+1*/ , P2D);

  smooth();

  //parts position
  for(int i=0; i<Parts; i++){
    pos[i] = (offset);
    offset = offset + sise;
  }

  for (int a=0; a<Parts; a++){
    for (int b=0; b<Parts; b++){
      x[a] = pos[a];
      y[b] = pos[b];
    }
  }

  // parts paint

  //fill 1st half of invasor
  for (int pc=0; pc<(Parts*ceil(Parts/2.0)); pc++){
    int rdm = round(random(col.length-1)); 
    partcol[pc]=col[rdm];
  }
  //copy to the 2nd half
  if (oddOrEven == 1.0){
    for (int f=0;f<Parts;f=f+2){
      if(Parts>f){
        for (int pc=(Parts*ceil(Parts/2.0)+(Parts*(f/2-1))); pc<Parts*Parts; pc++){
          partcol[pc]=partcol[pc-(Parts*f)];
        }
      }
    }
  }
  if (oddOrEven == 0.0){
    //copy to the 2nd half
    for (int f=1;f<Parts;f=f+2){
      if(Parts>f){
        for (int pc=(Parts*ceil(Parts/2.0)+(Parts*(f/2))); pc<Parts*Parts; pc++){
          partcol[pc]=partcol[pc-(Parts*f)];
        }
      }
    }
  }


}

void draw(){
  background(255,44,43);



  for (int q=0; q<Parts; q++){
    for (int w=0; w<Parts; w++){
      strokeWeight(sise-1);
      stroke(0,255-partcol[j]);
      point(sise/2+x[q],sise/2+y[w]);

      j = j + 1;
      if(j == Parts*Parts){
        j = 0;
      }

    }

  }

}







void mousePressed(){
 // parts paint
 //fill 1st half of invasor
  for (int pc=0; pc<(Parts*ceil(Parts/2.0)); pc++){
    int rdm = round(random(col.length-1)); 
    partcol[pc]=col[rdm];
  }
  //copy to the 2nd half
  if (oddOrEven == 1.0){
    for (int f=0;f<Parts;f=f+2){
      if(Parts>f){
        for (int pc=(Parts*ceil(Parts/2.0)+(Parts*(f/2-1))); pc<Parts*Parts; pc++){
          partcol[pc]=partcol[pc-(Parts*f)];
        }
      }
    }
  }
  if (oddOrEven == 0.0){
    //copy to the 2nd half
    for (int f=1;f<Parts;f=f+2){
      if(Parts>f){
        for (int pc=(Parts*ceil(Parts/2.0)+(Parts*(f/2))); pc<Parts*Parts; pc++){
          partcol[pc]=partcol[pc-(Parts*f)];
        }
      }
    }
  }


}

