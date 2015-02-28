
/*Prime Finder by ADAM SCHMIDT
read title(it somehow relates to what this program does)
If you download this and uncomment what is to be
uncommented it creates a mighty prime file
*/

/* uncomment following if you wish to create a file with the primes

PrintWriter output;
*/
int[] primenums = new int[1];

  PFont font;
      int p = 2;

int lp = 2; 
int mn =2;
int k = 2;
void setup(){
  primenums[0] = 2;
  size(500,50);
   font = loadFont("EurostileBold-10.vlw"); 
     background(0);
     /* uncomment following if you wish to create a file with the primes

     output = createWriter("primes.txt");
     */
}
void draw(){

//println(primes.size());
//println(primes.get(0));
  fill(0);
  rect(0,0,280,50);
    fill(255);
    boolean prime = true;
  for(int l = 0;l  < primenums.length; l = l + 1){
 // println(l);

  int primenum = primenums[l];
  //println(l); 
    if(p %  primenum == 0){

      prime = false;
      
    }


   
  }
  if(prime == true){

    lp = p;
    primenums = expand(primenums, primenums.length+1);
    println(primenums.length);
    primenums[primenums.length-1]=lp;
//    if((pow(2, mn))-1 == lp){
//      fill(0);
//      rect(280,0,280,50);
//      fill(255);
//    textFont(font, 10); 
//  text(mn+" m primes num", 400, 20);
//  
//
//
//      mn = mn +1;
//      
//
//        textFont(font, 10); 
//  text(lp, 500, 20);
//    }
  }
  //delay(500);
  textFont(font, 10); 
  text(primenums.length, 20, 20);
  

  textFont(font, 10); 
  text(lp, 200, 20);
  /* uncomment following if you wish to create a file with the primes

  output.println(j+"#"+lp+"<prime");
  */  

  p = p +1;
  //println(j);
}



/* uncomment following if you wish to create a file with the primes

void keyPressed() {
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}
*/



