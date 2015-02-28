
//DATA Visualization Homework
//http://www.nationmaster.com/red/time.php?stat=med_per_com_percap&country=us&b_printable=1
//Personal Computers per capita - USA - 1980 til 2000
int data [] ={9329, 9238, 23870, 52054, 81331, 106210, 129720, 156177, 184377, 200147, 217127, 233219, 251448, 270084, 294536, 324097, 358583, 399770, 449513, 505304, 570469}; //data goes here
int datay [] ={1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000};
void setup(){
  size(600,600);
  background(51);
  smooth();
}

void draw(){

   
      for(int i = 0; i < data.length; i++){
    float ellSize = map(data[i],7000, 600000, 10, 530);
    //float ellSize = map(datay[i],1978, 2002, 20, 500);
    rectMode(RIGHT);
   fill(26,ellSize,ellSize, 20);
    rect(300, ellSize+10,ellSize,10);
  stroke(ellSize);
      
      for(int u = 0; u < data.length; u++){
        fill(2,191,35, ellSize);
        textAlign(RIGHT);
    text(data[i],570,(ellSize+15));
    textAlign(LEFT);
    text(datay[i],((ellSize+5)/1.5),ellSize+5);
  }}
  stroke(0);
  quad(0, 600,
        0, 480, 
        314, 540,  
        350, 600);
  line(0, 15,345, 600);
  line(0, 485,600, 600);
  fill(0);
  text("Personal Computers Per Capita in the USA", 5, 550);
  text("1980 till 2000", 5, 570);
 
  fill(100);
   text("Information thanks to: nationmaster.com", 50, 596);
}
  //println( data.length);


