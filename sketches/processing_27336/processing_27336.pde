
class Element
{
  float rr;
  int id, sX, sY, sZ;
  color c;

  PVector p1, p2, p3, p4, r1, r2, r3, r4;

  Element (int id_, PVector p1_, PVector p2_, PVector p3_, PVector p4_, int sX_, int sY_, int sZ_, color c_, PVector r1_, PVector r2_, PVector r3_, PVector r4_, float rr_)
  {
    id = id_;

    p1 = p1_;
    p2 = p2_;
    p3 = p3_;
    p4 = p4_;

    r1 = r1_;
    r2 = r2_;
    r3 = r3_;
    r4 = r4_;

    sX = sX_;
    sY = sY_;
    sZ = sZ_;

    c = c_;
    rr = rr_;
  }

  void upDatePos(PVector p1_, PVector p2_,PVector p3_, PVector p4_, PVector r1_, PVector r2_, PVector r3_, PVector r4_)
  {
    p1 = p1_;
    p2 = p2_;
    p3 = p3_;
    p4 = p4_;

    r1 = r1_;
    r2 = r2_;
    r3 = r3_;
    r4 = r4_;
  }

  void upDateRR (float rr_)
  {
    rr = rr_;
  }
}


