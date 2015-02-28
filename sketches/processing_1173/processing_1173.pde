
/**
<p>An implementation and visualization of Kanerva's Sparse Distributed Memory as described by <a href="http://cs.gmu.edu/cne/pjd/PUBS/amsci-sdm.pdf">Peter Denning</a>. Each color represents a piece of information stored in memory.</p>
<p>The idea is to mimic human memory with a structure that can make connections between seemingly unrelated information, recall more salient information more accurately, and have quick recall of all information.</p>
<p>This implementation (done in collaboration with <a href="http://lonelypinkelephants.com/">Jason LaPorte</a>) is mostly an exercise in efficiency &mdash; the spirit of SDM is highly parallel, which makes it hard to implement on serial machines.</p>
<p>Future work may include applying the SDM to algorithmic composition (aural and visual) and adaptive dithering.</p>
*/

int step;
int updateRate = 30; // in ms
SparseDistributedMemory s;

void setup () {
  size (256, 256, P3D);
  frameRate (60);
  
  step = 0;
  s = new SparseDistributedMemory (16, 2);
  
  for (int i = 1; i < 16; ++i)
    s.remember ((int) random (s.s), (int) random (s.s));
}

void draw () {
  if (step < s.s) {
    int m = millis ();
  
    loadPixels ();
    while (step < s.s && millis () - m < updateRate) {
      pixels[step] = i16toi24 (s.recall (step));
      ++step;
    }
    updatePixels ();
  }
}

void mousePressed () { setup (); }

int i16toi24 (int i) {
  return (( i        & 3) << 22) |
         (((i >>  2) & 3) << 19) |
         (((i >>  4) & 3) << 16) |
         (((i >>  6) & 3) << 13) |
         (((i >>  8) & 3) << 10) |
         (((i >> 10) & 3) <<  7) |
         (((i >> 12) & 3) <<  4) |
         (((i >> 14) & 3) <<  1);
}


