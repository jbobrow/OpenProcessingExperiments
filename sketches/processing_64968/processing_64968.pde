
import correlations.library.*;

Board b;

void setup() {
  size(1000, 680, JAVA2D);
  smooth();
  b = new Board(this);

  //the class Board:
  //you can create new Elements with void put(String name, Element e);
  b.put("Legal", new Element(b, 11, 100, color(255, 0, 255)));
  b.put("Exec_Dept", new Element(b, 29, 100, color(255, 0, 255)));
  b.put("Trans_Legal", new Element(b, 13, 100, color(255, 0, 255)));
  b.put("Comm", new Element(b, 61, 100, color(255, 0, 255)));
  b.put("Trans_Mgmt", new Element(b, 37, 100, color(255, 0, 255)));

  b.put("Reg_Info", new Element(b, 28, 100, color(255, 255, 0)));
  b.put("Info_Sys", new Element(b, 39, 100, color(255, 255, 0)));
  b.put("Arjis", new Element(b, 42, 100, color(255, 255, 0)));
  b.put("Reg_Models", new Element(b, 45, 100, color(255, 255, 0)));
  b.put("Policy/Research", new Element(b, 35, 100, color(255, 255, 0)));
  b.put("Tech_Srvc", new Element(b, 17, 100, color(255, 255, 0)));

  b.put("Bus_Srvc", new Element(b, 65, 100, color(255, 0, 0)));
  b.put("HR", new Element(b, 15, 100, color(255, 0, 0)));
  b.put("Cont/Proc", new Element(b, 24, 100, color(255, 0, 0)));

  b.put("Prog_Cnt", new Element(b, 10, 100, color(0, 255, 0)));
  b.put("Finance", new Element(b, 11, 100, color(0, 255, 0)));
  b.put("Acct", new Element(b, 27, 100, color(0, 255, 0)));

  b.put("Trans_Plan", new Element(b, 29, 100, color(0, 255, 255)));
  b.put("Long_Plan", new Element(b, 22, 100, color(0, 255, 255)));
  b.put("Env_Plan", new Element(b, 15, 100, color(0, 255, 255)));

  b.put("Const", new Element(b, 8, 100, color(0, 0, 255)));
  b.put("Moblty_Mgmt", new Element(b, 15, 100, color(0, 0, 255)));
  b.put("Engring", new Element(b, 56, 100, color(0, 0, 255)));
  b.put("Trans_Offc", new Element(b, 25, 100, color(0, 0, 255)));
  b.put("Trans_Srvc", new Element(b, 25, 100, color(0, 0, 255)));


  // b.put("Common", new Element(b, 165, 100, color(130, 130, 130)));

  //define relations:
  //you can also define custom arrow colors:
  //b.get("Admin").addRelation(b.get("Tech"), 1, color(..);

  // Executive Offices

  b.get("Legal").addRelation(b.get("Exec_Dept"), 1, color(200, 200, 200));
  b.get("Legal").addRelation(b.get("Const"), 1, color(200, 200, 200));
  b.get("Legal").addRelation(b.get("Engring"), 1, color(200, 200, 200));
  b.get("Legal").addRelation(b.get("Cont/Proc"), 1, color(200, 200, 200));

  b.get("Exec_Dept").addRelation(b.get("Legal"), 1, color(200, 200, 200));
  b.get("Exec_Dept").addRelation(b.get("Trans_Legal"), 5, color(200, 200, 200));
  b.get("Exec_Dept").addRelation(b.get("Comm"), 1, color(200, 200, 200));

  b.get("Trans_Legal").addRelation(b.get("Exec_Dept"), 5, color(200, 200, 200));
  b.get("Trans_Legal").addRelation(b.get("Comm"), 1, color(200, 200, 200));
  b.get("Trans_Legal").addRelation(b.get("Prog_Cnt"), 1, color(200, 200, 200));

  b.get("Comm").addRelation(b.get("Trans_Legal"), 1, color(200, 200, 200));
  b.get("Comm").addRelation(b.get("Exec_Dept"), 1, color(200, 200, 200));
  b.get("Comm").addRelation(b.get("Trans_Mgmt"), 1, color(200, 200, 200));
  b.get("Comm").addRelation(b.get("Trans_Plan"), 1, color(200, 200, 200));
  b.get("Comm").addRelation(b.get("Policy/Research"), 1, color(200, 200, 200));

  b.get("Trans_Mgmt").addRelation(b.get("Comm"), 1, color(200, 200, 200));
  b.get("Trans_Mgmt").addRelation(b.get("Moblty_Mgmt"), 5, color(200, 200, 200));
  b.get("Trans_Mgmt").addRelation(b.get("Long_Plan"), 1, color(200, 200, 200));

  //Technical Services

  b.get("Reg_Info").addRelation(b.get("Long_Plan"), 1, color(200, 200, 200));
  b.get("Reg_Info").addRelation(b.get("Reg_Models"), 1, color(200, 200, 200));
  b.get("Reg_Info").addRelation(b.get("Tech_Srvc"), 1, color(200, 200, 200));
  b.get("Reg_Info").addRelation(b.get("Info_Sys"), 1, color(200, 200, 200));
  b.get("Reg_Info").addRelation(b.get("Arjis"), 5, color(200, 200, 200));

  b.get("Info_Sys").addRelation(b.get("Reg_Info"), 1, color(200, 200, 200));
  b.get("Info_Sys").addRelation(b.get("Arjis"), 1, color(200, 200, 200));

  b.get("Arjis").addRelation(b.get("Reg_Info"), 5, color(200, 200, 200));
  b.get("Arjis").addRelation(b.get("Reg_Models"), 5, color(200, 200, 200));
  b.get("Arjis").addRelation(b.get("Info_Sys"), 1, color(200, 200, 200));
  b.get("Arjis").addRelation(b.get("Trans_Srvc"), 1, color(200, 200, 200));

  b.get("Reg_Models").addRelation(b.get("Arjis"), 5, color(200, 200, 200));
  b.get("Reg_Models").addRelation(b.get("Reg_Info"), 1, color(200, 200, 200));
  b.get("Reg_Models").addRelation(b.get("Long_Plan"), 1, color(200, 200, 200));
  b.get("Reg_Models").addRelation(b.get("Trans_Plan"), 1, color(200, 200, 200));
  b.get("Reg_Models").addRelation(b.get("Reg_Info"), 1, color(200, 200, 200));

  b.get("Policy/Research").addRelation(b.get("Tech_Srvc"), 1, color(200, 200, 200));
  b.get("Policy/Research").addRelation(b.get("Comm"), 1, color(200, 200, 200));
  b.get("Policy/Research").addRelation(b.get("Bus_Srvc"), 1, color(200, 200, 200));

  b.get("Tech_Srvc").addRelation(b.get("Policy/Research"), 1, color(200, 200, 200));
  b.get("Tech_Srvc").addRelation(b.get("Reg_Info"), 1, color(200, 200, 200));

  //Administration

  b.get("Bus_Srvc").addRelation(b.get("Policy/Research"), 1, color(200, 200, 200));

  b.get("HR").addRelation(b.get("Finance"), 5, color(200, 200, 200)); 

  b.get("Cont/Proc").addRelation(b.get("Acct"), 5, color(200, 200, 200));
  b.get("Cont/Proc").addRelation(b.get("Trans_Offc"), 1, color(200, 200, 200));
  b.get("Cont/Proc").addRelation(b.get("Engring"), 1, color(200, 200, 200));
  b.get("Cont/Proc").addRelation(b.get("Legal"), 1, color(200, 200, 200));

  //Finance
  b.get("Prog_Cnt").addRelation(b.get("Trans_Legal"), 1, color(200, 200, 200));
  b.get("Prog_Cnt").addRelation(b.get("Moblty_Mgmt"), 1, color(200, 200, 200));

  b.get("Acct").addRelation(b.get("Cont/Proc"), 5, color(200, 200, 200));

  b.get("Finance").addRelation(b.get("HR"), 5, color(200, 200, 200));
  b.get("Finance").addRelation(b.get("Trans_Srvc"), 5, color(200, 200, 200));
  b.get("Finance").addRelation(b.get("Trans_Offc"), 5, color(200, 200, 200));

  //Land Use
  b.get("Trans_Plan").addRelation(b.get("Comm"), 1, color(200, 200, 200));
  b.get("Trans_Plan").addRelation(b.get("Long_Plan"), 1, color(200, 200, 200));
  b.get("Trans_Plan").addRelation(b.get("Reg_Models"), 1, color(200, 200, 200));

  b.get("Long_Plan").addRelation(b.get("Trans_Plan"), 1, color(200, 200, 200));
  b.get("Long_Plan").addRelation(b.get("Reg_Models"), 1, color(200, 200, 200));
  b.get("Long_Plan").addRelation(b.get("Reg_Info"), 1, color(200, 200, 200));
  b.get("Long_Plan").addRelation(b.get("Trans_Srvc"), 1, color(200, 200, 200));
  b.get("Long_Plan").addRelation(b.get("Engring"), 1, color(200, 200, 200));
  b.get("Long_Plan").addRelation(b.get("Const"), 1, color(200, 200, 200));
  b.get("Long_Plan").addRelation(b.get("Trans_Mgmt"), 1, color(200, 200, 200));

  //Mobility
  b.get("Const").addRelation(b.get("Engring"), 5, color(200, 200, 200));
  b.get("Const").addRelation(b.get("Long_Plan"), 1, color(200, 200, 200));
  b.get("Const").addRelation(b.get("Legal"), 1, color(200, 200, 200));

  b.get("Moblty_Mgmt").addRelation(b.get("Trans_Mgmt"), 5, color(200, 200, 200));
  b.get("Moblty_Mgmt").addRelation(b.get("Prog_Cnt"), 1, color(200, 200, 200));

  b.get("Engring").addRelation(b.get("Const"), 5, color(200, 200, 200));
  b.get("Engring").addRelation(b.get("Trans_Offc"), 1, color(200, 200, 200));
  b.get("Engring").addRelation(b.get("Long_Plan"), 1, color(200, 200, 200));
  b.get("Engring").addRelation(b.get("Legal"), 1, color(200, 200, 200));
  b.get("Engring").addRelation(b.get("Cont/Proc"), 1, color(200, 200, 200));
  b.get("Engring").addRelation(b.get("Trans_Srvc"), 1, color(200, 200, 200));

  b.get("Trans_Srvc").addRelation(b.get("Engring"), 1, color(200, 200, 200));
  b.get("Trans_Srvc").addRelation(b.get("Long_Plan"), 1, color(200, 200, 200));
  b.get("Trans_Srvc").addRelation(b.get("Arjis"), 1, color(200, 200, 200));
  b.get("Trans_Srvc").addRelation(b.get("Finance"), 1, color(200, 200, 200));

  b.get("Trans_Offc").addRelation(b.get("Engring"), 1, color(200, 200, 200));
  b.get("Trans_Offc").addRelation(b.get("Cont/Proc"), 1, color(200, 200, 200));
  b.get("Trans_Offc").addRelation(b.get("Finance"), 1, color(200, 200, 200));
}

void draw() {
  background(255);
  b.display();
}

void keyReleased() {
  if (key == 'p') b.runPhysics = !b.runPhysics;
  if (key == 'v') b.listView = !b.listView;
  if (key == 's') saveFrame();
}


