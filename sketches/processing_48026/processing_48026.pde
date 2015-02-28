
class Record {
  
  int count, conf;
  PVector pos_qk1,pos_aqk1,pos_qk2,pos_aqk2,c_masa,v_k,v_l;

  public Record(String[] pieces) {
    
    count = int(pieces[0]);
    conf = int(pieces[1]);
    
    pos_qk1 = new PVector(float(pieces[3]),float(pieces[4]),float(pieces[5]));
    pos_qk2 = new PVector(float(pieces[6]),float(pieces[7]),float(pieces[8]));
    
    pos_aqk1 = new PVector(float(pieces[9]),float(pieces[10]),float(pieces[11]));    
    pos_aqk2 = new PVector(float(pieces[12]),float(pieces[13]),float(pieces[14]));

    c_masa = new PVector(float(pieces[15]),float(pieces[16]),float(pieces[17]));
    
    v_k = new PVector(float(pieces[18]),float(pieces[19]),float(pieces[20]));
    v_l = new PVector(float(pieces[21]),float(pieces[22]),float(pieces[23]));

        
/*    pos_quark1.set(float(pieces[3]),float(pieces[4]),float(pieces[5]));
    pos_quark2.set(float(pieces[6]),float(pieces[7]),float(pieces[8]));
    
    pos_antiquark1.set(float(pieces[9]),float(pieces[10]),float(pieces[11]));    
    pos_antiquark2.set(float(pieces[12]),float(pieces[13]),float(pieces[14]));

    c_masa.set(float(pieces[15]),float(pieces[16]),float(pieces[17]));
    
    vector_k.set(float(pieces[18]),float(pieces[19]),float(pieces[20]));
    vector_l.set(float(pieces[21]),float(pieces[22]),float(pieces[23]));*/
  }
}

