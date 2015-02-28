
class CompanderFilter implements AudioEffect
{
  float[] level ={0.0,0.0};
  float[] comp={0.25,0.25}; 
  float[] filt1={0.0,0.0};
  float[] filt2={0.0,0.0};
  float[] filt3={0.0,0.0};
  float[] op;
  void process(float[] samp,int ch)
  {
    op = new float[samp.length];
    int i = samp.length;
    for (int j = 0; j < i; j++)
    {
      level[ch] = ((19000*level[ch]) +abs(samp[j]))/19001;
      comp[ch] = (((0.1+level[ch])/(0.05+(level[ch]))))/2.;
      filt1[ch] = ((6.0*filt1[ch])+(samp[j]))/7.;// lo-Pass filter
      
            filt2[ch] = ((6100.0*filt2[ch])+filt1[ch])/6102.;// hi-pass Filter
            filt3[ch] = ((610.0*filt3[ch])+filt2[ch])/611.;
      op[j] = (filt1[ch]+filt3[ch]-(filt2[ch])*2.)*comp[ch]*8.0;
    }
    // we have to copy the values back into samp for this to work
    arraycopy(op, samp);
  }
 void process(float[] mono){
  // int p=0;
  process(mono,0); 
   
 }
  void process(float[] left, float[] right)
  {
    process(left,0);
    process(right,1);
  }
}


