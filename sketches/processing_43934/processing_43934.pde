
//-----------------------------------------------------------------------------POPULATE
void populate() {
  Table tdata3 = new Table("data3.csv");
  int n = tdata3.getRowCount();
  for(int i=0; i<n; i++) {data3[i]=tdata3.getInt(i,0);}
  
  Table tdata2 = new Table("data2.csv");
  n = tdata2.getRowCount();
  for(int i=0; i<n; i++) { data2[i]=tdata2.getInt(i,0); }
  
  Table tdata1 = new Table("data1.csv");
  n = tdata1.getRowCount();
  for(int i=0; i<n; i++) { data1[i]=tdata1.getInt(i,0); }
  
  Table tdata4 = new Table("data4.csv");
  n = tdata4.getRowCount();
  for(int i=0; i<n; i++) { data4[i]=tdata4.getInt(i,0); }

  Table tdata5 = new Table("data5.csv");
  n = tdata5.getRowCount();
  for(int i=0; i<n; i++) { data5[i]=tdata5.getInt(i,0); } 
}

