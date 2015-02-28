
/*Here is a render (may take a few minutes, depending on your 
processor) of a waveform created from a repeating  bezier
curve wiith a fill to ceate a gradient on the graphic that is 
fluid and layered to obeserve moire efects. The modulus function 
dds another texture to the form of the moire by altering the gaps
between repetitions. For loops & conditionals learned from textbook
p. 61 & 51 */

//Jordan Dozzi

background(0);
size(900,900);
smooth();


for (int y = 1; y <= 900; y += 5) {
  for (int x = 1; x <= 900; x += 5) {
    if ((x % 10) == 0) {
      fill (50,50,255,255);
    } 
    else {
      bezier(x*0.01, y*0.01, x+3, y+3, x+6, y+6, y, x);
      fill(255,1);
    }
  }
}



