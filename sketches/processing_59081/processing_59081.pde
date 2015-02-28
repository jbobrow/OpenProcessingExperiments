
//package kremala;

import java.applet.Applet;
import java.awt.Button;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Kremala extends Applet implements ActionListener,KeyListener {

    int mikos;
    int prwto;
    int count;
    char grama;
    String gr;
    int s;
    boolean x=true;
    boolean los=false;
    boolean win=false;
    boolean d=true;
    boolean minima=false;
    String c1;
    String sqr;
    String st;
    String c2;
    String sq="";
    String sr="";
    String lexi="";
    String start="";
    char ch;
    boolean orio;
    boolean glwssa;
    boolean xar;
    boolean nw;
    boolean pliktro=false;
    boolean re=false;
    boolean flag;
    boolean energo=false;
    boolean e1=false,e2=false,e3=false,e4=false,e5=false,e6=false;
    double pososto;
    double nikes;
    double sum;
    int eu;
    int body;
    int matia=96;
    boolean key=true;
    String lexis="";
    String word="";
    String w="";
    boolean lo=false;
    byte []data=new byte[10000];
    private Button pa,dwse,replay,alfa, bita, gama, delta, epslon, zita, ita, thita, giota, kapa, lamda, mi, ni, ksi, omikron, pi, ro, sigma, taf, ipsilon, fi, xi, psi, omga;
    @Override
    public void stop(){
     if(!(start.equals(""))){
      pa.setEnabled(true);
      setEnable();
     }
      if(lo)
        sum--;
      
    }
    @Override
    public void init() {         
        /*
          arxeio gia tis lexis
                FileInputStream f=null;
                DataInputStream df=null;
                try {
                   f = new FileInputStream("C:\\Program Files\\Opera\\words.txt");
                } catch (FileNotFoundException ex) {
                  Logger.getLogger(Kremala.class.getName()).log(Level.SEVERE, null, ex);
                 }
                df=new DataInputStream(f);
                 try {
                    df.read(data);
                 } catch (IOException ex) {
                    Logger.getLogger(Kremala.class.getName()).log(Level.SEVERE, null, ex);
                 }
                 for(int i=0;i<data.length;i++){
               
                 
                  if(data[i]=='a')lexis+='α';  
                  else if(data[i]=='v')lexis+='β';
                  else if(data[i]=='g')lexis+='γ';
                  else if(data[i]=='d')lexis+='δ';
                  else if(data[i]=='e')lexis+='ε';
                  else if(data[i]=='z')lexis+='ζ';
                  else if(data[i]=='h')lexis+='η';
                  else if(data[i]=='8')lexis+='θ';
                  else if(data[i]=='i')lexis+='ι';
                  else if(data[i]=='k')lexis+='κ';
                  else if(data[i]=='l')lexis+='λ';
                  else if(data[i]=='m')lexis+='μ';
                  else if(data[i]=='n')lexis+='ν';
                  else if(data[i]=='3')lexis+='ξ';
                  else if(data[i]=='o')lexis+='ο';
                  else if(data[i]=='p')lexis+='π';
                  else if(data[i]=='r')lexis+='ρ';
                  else if(data[i]=='s')lexis+='σ';
                  else if(data[i]=='t')lexis+='τ';
                  else if(data[i]=='u')lexis+='υ';
                  else if(data[i]=='f')lexis+='φ';
                  else if(data[i]=='x')lexis+='χ';
                  else if(data[i]=='c')lexis+='ψ';
                  else if(data[i]=='w')lexis+='ω';
                  else if(data[i]==',')lexis+=',';
            
                 }
*/
              
        lexis=",κοτα,καποτα,μαυρισμα,βαλιτσα,μαιυτηριο,μαθηματικα,ιστορια,αρχαιολογια,μπριζολα,βοδινο,πορτοκαλι,προγραμματισμος,λιβαδι,γκετο,ενδεικτικος,τηλεπικοινωνιες,νοητικος,αποκαλυψη,θεραπεια,ομοιωμα,αρεστος,ενστικτωδως,αρωμα,αρωματοθεραπεια,φωλια,απολυμενος,μεντα,υποατομικο,ερμηνευτικο,κβαντομηχανικη,σχετικοτητα,φορμολισμος,αντιληψη,φαυλος,κυκλος,ψυχολογιοποιηση,πληθυσμος,φυλετικος,ρατσισμος,συμπαρασταση,προσπαθεια,αλληλεγγυη,διακριση,στερεοτυπα,επιφυλακτικος,εμφυτος,σφαιρα,κυρος,φιλοσοφος,σοφος,αγγελος,αγχωδης,αυτοσαρκασμος,ασυναισθητα,απωτερος,ντιλεταντης,αρρητος,αμυδρος,σκοταδι,εξαψη,παπαρουνα,παπαγαλος,παραγωγος,αντενδειξη,κοιμησμενος,ερμηνευτης,μπαουλο,κουτος,κουκος,πονηρος,σιγανοπαπαδια,ζυμαρι,τουλουμπα,τεμαχια,χρονος,ανειξη,ανηθικη,εκδικαζω,ασπρομαυρη,απολαβες,ογκος,ανωφελο,ωφελημενος,ισοτιμια,κρεπα,συνταγη,αναμνηστικο,ρευστοτητα,τραπεζι,πληροφορικη,σκακι,ανυσυχος,αξιος,ορος,πολυπλοκοτητα,αλγοριθμος,συχνα,διοικητικο,εφετειο,επιχειρηση,προσαυξηση,επιβολη,ταμειακη,μηχανη,χρονος,χρηματα,φορος,καρδια,αγαπη,ψυχη,πονος,παρεχω,σχετικος,προσφυγη,βοηθημα,καταλογισμος,εισπραξη,συνεισπραττομενο,προσφυγας,ευθεως,σπαθι,κληση,ξυλινος,αδρεναλινη,λιωμνος,παγωτο,βασιλιας,σκονη,κιτρινο,ποδηλατο,χαμενος,ταξιδευω,γραμμα,περιγραφη,τελειος,μοναχοπαιδι,λειτουργικο,συστημα,κρεμαλα,ηλιος,γελαστος,κουνιστος,φανταρος,συνδυασμος,βρεφος,βραχιολια,ωροσκοπος,επιπλο,φορμα,συμβουλιο,βρογχιτιδα,βραδυνη,βαθμολογια,βουλη,βιογραφικο,βιοιατρικη,βημα,βιολογικο,επανασταση,καριερα,κτηματολογιο,κλεμμενο,κρανος,στολη,πιστοποιητικο,γλωσσομαθεια,κρατικο,κρεβατι,χρηματιστηριο,ωορηξια,ταχυδρομικα,γαλακτομπουρεκοou,γαριδομακαροναδα,γιουβαρλακια,γερανος,τρομακτικο,τροκτικο,ρεβυθι,αρβυλες,στατιστικη,υπηρεσια,παροχη,πειρασμος,προγραμμα,νηστικος,νηστισιμο,φαγητο,μηλοπιτα,μεταφραση,ειδησεις,οικονομια,αποτιμηση,ειδοποιηση,προσωπικο,σελιδα,χαρτοφυλακιο,ρεκορ,θερμιδομετρητης,θεατρο,πανελληνιες,σχολικο,καθαρευουσα,";
        alfa = new Button("Α");

        add(alfa);
        
        bita = new Button("Β");
        add(bita);

        gama = new Button("Γ");
        add(gama);

        delta = new Button("Δ");
        add(delta);

        epslon = new Button("Ε");
        add(epslon);

        zita = new Button("Ζ");
        add(zita);

        ita = new Button("Η");
        add(ita);

        thita = new Button("Θ");
        add(thita);

        giota = new Button("Ι");
        add(giota);

        kapa = new Button("Κ");
        add(kapa);

        lamda = new Button("Λ");
        add(lamda);

        mi = new Button("Μ");
        add(mi);

        ni = new Button("Ν");
        add(ni);

        ksi = new Button("Ξ");
        add(ksi);

        omikron = new Button("Ο");
        add(omikron);

        pi = new Button("Π");
        add(pi);

        ro = new Button("Ρ");
        add(ro);

        sigma = new Button("Σ");
        add(sigma);

        taf = new Button("Τ");
        add(taf);

        ipsilon = new Button("Υ");
        add(ipsilon);

        fi = new Button("Φ");
        add(fi);

        xi = new Button("Χ");
        add(xi);

        psi = new Button("Ψ");
        add(psi);

        omga = new Button("Ω");
        add(omga);
        
        alfa.addActionListener(this);
        bita.addActionListener(this);
        gama.addActionListener(this);
        delta.addActionListener(this);
        epslon.addActionListener(this);
        zita.addActionListener(this);
        ita.addActionListener(this);
        thita.addActionListener(this);
        giota.addActionListener(this);
        kapa.addActionListener(this);
        lamda.addActionListener(this);
        mi.addActionListener(this);
        ni.addActionListener(this);
        ksi.addActionListener(this);
        omikron.addActionListener(this);
        pi.addActionListener(this);
        ro.addActionListener(this);
        ipsilon.addActionListener(this);
        sigma.addActionListener(this);
        taf.addActionListener(this);
        fi.addActionListener(this);
        xi.addActionListener(this);
        psi.addActionListener(this);
        omga.addActionListener(this);       
        replay = new Button("Καινούρια λέξη!");        
        add(replay); 
        replay.addActionListener(this);
        dwse=new Button("Δώσε λέξη");
        add(dwse);
        dwse.addActionListener(this);
        pa=new Button("Εμφάνισε λέξη");
        add(pa);
        pa.addActionListener(this);
        setNOEnable();
        pa.setEnabled(false);
    }
    public void ky(){
         addKeyListener(this);
         requestFocus();  
    }
    //@Override
    public void actionPerformed(ActionEvent e) {
        String g;
        g = e.getActionCommand();
         grama = g.charAt(0);
         energo=true;
        if(g.equals("Δώσε λέξη")){
                x=true;
                orio=false;
                glwssa=false;
                xar=false;
                minima=true;
                win=true;
                lo=false;
                los=true;
                start="";
                count=0;
                pa.setEnabled(false);
                //showStatus("Δώσε την λέξη και πάτα Enter: "+start);
                if(key){
                    ky();
                    key=false;
                }
                requestFocus();
                grama='a';
                nw=true;
                start="";
                lexi="";
                word="";
                w="";
                sr="";
                prwto=0;
                energo=false;
                eu=0;
                e1=false;
                e2=false;
                e3=false;
                e4=false;
                e5=false;
                e6=false;
    }
            else if(g.equals("Εμφάνισε λέξη")){
                pa.setEnabled(false);
                d=true;
                start=lexi;
                eu=6;
                e1=true;
                e2=true;
                e3=true;
                e4=true;
                e5=true;
                e6=true;
            }
            else {
                los=true;
                win=true;
                lo=false;
                nw=false;
                grama='j';
                start="";
                lexi="";
                word="";
                w=""; 
                sr="";
                energo=false;
                eu=0;
                e1=false;
                e2=false;
                e3=false;
                e4=false;
                e5=false;
                e6=false;
                setEnable();
                replay.setEnabled(false);
                dwse.setEnabled(false);
                pa.setEnabled(true);
                char ch;
                double rand;
                int intrand;
                int koma1;
                do
                {
                   rand=Math.random()*1800;
                   intrand=(int)rand;
                   koma1=lexis.indexOf(',',intrand);
                    ch=lexis.charAt(koma1+1);
                }while(ch==' '); 
                
                int koma2=lexis.indexOf(',',koma1+1);
                w=lexis.substring(koma1+1,koma2);
                StringBuilder buff = new StringBuilder(lexis);
                for(int i=1;i<w.length();i++)
                     buff.setCharAt(koma1+i,' ');  
                
                lexis=buff.toString();
                word=w.toUpperCase();
                mikos = word.length();
                c1 = word.substring(0, 1);        
                for (int i = 0; i < mikos; i++) {
                 if(i<mikos)
                   lexi+=word.charAt(i)+" ";
                 else 
                   lexi+=word.charAt(i);
                 } 
                 start = c1;
                for (int i = 0; i < mikos - 1; i++) {
                  start += " _";  
                  }
                 start+=" ";
                System.out.println(start+lexi);
                System.out.println(intrand);
      
    
            }
         
         switch (grama)
         {
             case 'Α':
                 alfa.setEnabled(false);
                 break; 
             case 'Β':
                 bita.setEnabled(false);
                 break; 
             case 'Γ':
                 gama.setEnabled(false);
                 break; 
             case 'Δ':
                 delta.setEnabled(false);
                 break; 
             case 'Ε':
                 epslon.setEnabled(false);
                 break; 
             case 'Ζ':
                 zita.setEnabled(false);
                 break; 
             case 'Η': 
                  ita.setEnabled(false);
                 break; 
             case 'Θ':
                 thita.setEnabled(false);
                 break; 
             case 'Ι':
                 giota.setEnabled(false);
                 break; 
             case 'Κ':
                 kapa.setEnabled(false);
                 break; 
             case 'Λ':
                lamda.setEnabled(false);
                 break; 
             case 'Μ':
                mi.setEnabled(false);
                 break; 
             case 'Ν':
                ni.setEnabled(false);
                 break; 
            case 'Ξ':
               ksi.setEnabled(false);
                 break; 
            case 'Ο':
                  omikron.setEnabled(false);
                 break; 
              case 'Π':
               pi.setEnabled(false);
                 break; 
             case 'Ρ':
            ro.setEnabled(false);
                 break; 
              case 'Σ':
              sigma.setEnabled(false);
                 break; 
             case 'Τ':
             taf.setEnabled(false);
                 break; 
            case 'Υ':
             ipsilon.setEnabled(false);
                 break; 
             case 'Φ':
              fi.setEnabled(false);
                 break; 
             case 'Χ':
             xi.setEnabled(false);
                 break; 
              case 'Ψ':
               psi.setEnabled(false);
                 break; 
              case 'Ω':
             omga.setEnabled(false);
                 break;                                       
         }
     
           repaint();
        
    }

    @Override
    public void paint(Graphics g) {
        
        Font f = new Font("Ariel", Font.BOLD,25);
        Font f2=new Font("Arial", Font.BOLD,40);
        Font f3=new Font("Arial", Font.BOLD,10);
        Font f4=new Font("Arial", Font.BOLD,15);
        Color brown=new Color(160,82,45);
        Color bbrown=new Color(139,69,19);
        Color back=new Color(100,149,237); 
        setBackground(back);
        

        //kremala  
        g.setColor(Color.BLACK);
        g.fillRect(40, 40, 30, 550);  
        g.fillRect(40, 40, 175, 20);
        g.setColor(Color.GRAY);
        g.drawLine(40,40,68,58);
        g.setColor(brown);
        g.drawLine(175, 60, 175, 120);
        //setBackground(back);
        g.setColor(brown);
        g.fillRect(0,550,1200,300);
        g.setColor(Color.BLACK);       
        g.setFont(f3);
        g.drawString("J Company Copyright 2012",15,37);

       
        if(xar){
            g.setFont(f4);
            g.drawString("Το όριο είναι 25 χαρακτήρες ",350,360);
        }
        else if(orio){
            g.setFont(f4);
            g.drawString("Το ελάχιστο όριο ειναι 4 χαρακτήρες ",350,360);
        }
        else if(glwssa){
            g.setFont(f4);
            g.drawString("Μόνο Ελληνικοί χαρακτήρες επιτρέπονται ",350,360);
          }
        else if(minima){
            g.setFont(f4);
            g.drawString("Δώσε την λέξη και πάτα Enter ή Space: ",350,360);
        }
            
        g.setFont(f);
        g.drawString(start, 350,400);
         
         int index;
         
         for(int i=2;i<=start.length();i++)
         {
         index=lexi.indexOf(grama,i);
         
         if (index != -1) 
         {
            StringBuilder buff = new StringBuilder(start);
            g.setColor(back);
            g.fillRect(270, 150, 750,300);
            buff.setCharAt(index, grama);
            g.setColor(Color.BLACK);
            g.setFont(f);
            g.drawString(buff.toString(), 350,400); 
            start=buff.toString();  
           
            flag=true;
            if(start.equals(lexi)&& eu<6 && win)
            {
                   win=false;
                   sum++;
                   nikes++;
                   pososto=(nikes/sum)*100.0;
                  repaint();
                //showStatus("niki-->sinolo: "+(int)sum+"niks: "+(int)nikes+"pososto: "+(int)pososto+"%");
            }
           
            if(start.equals(lexi)&& eu<6)
            {
                
                replay.setEnabled(true);
                dwse.setEnabled(true);
                g.setFont(f2);
                g.setColor(Color.GREEN);
                g.drawString("YOU WIN", 350,150);
                setNOEnable();
                pa.setEnabled(false);
  
           }
        }
      
       }
   
       if(flag==true)
           flag=false;
       else if(energo)
       {
           eu++;
           if(eu==1)
           {
               
               e1=true;
           }
           else if(eu==2)
           {
            
               e2=true;
           }
           else if(eu==3)
           {
               
               e3=true;
           }
           else if(eu==4)
           {
               flag=true;
               e4=true;
           }
           else if(eu==5)
           {
               e5=true;
           }
           else if(eu==6)
           {
            
               e6=true;
           }    
           
           energo=false;
       }    
      //////////////////////////////////////////////////         
       if(e1 && !e6)
       {
       
         //prosopo
        g.setColor(Color.PINK);
        g.fillOval(155, 80, 40, 55);
        //matia
        g.setColor(Color.WHITE);
        g.fillOval(165, 95, 7, 7);
        g.fillOval(180, 95, 7, 7);
        g.fillOval(181, 96, 4, 4);
        g.fillOval(166, 96, 4, 4);
        g.setColor(Color.BLUE);
        if(matia==96){
        g.fillOval(183, 98, 4, 4);
        g.fillOval(168, 98, 4, 4);
        matia=98;
        }
        else {
             g.fillOval(183, 96, 4, 4);
             g.fillOval(168, 96, 4, 4);
             matia=96;
        }
        //miti
        g.setColor(Color.BLACK);
        g.drawLine(174, 105, 172, 110);
        g.drawLine(175, 110, 173, 110);
        //autia
        g.setColor(Color.PINK);
        g.fillOval(150, 99, 10, 10);
        g.fillOval(190, 99, 10, 10);
        g.setColor(Color.BLACK);
        g.fillOval(153, 102, 1, 2);
        g.fillOval(196, 102, 1, 2);
        //stoma
        g.drawLine(170, 120, 180, 120);
        //lemos
        g.setColor(Color.PINK);
        g.fillRect(169, 128, 12, 15);
        g.setColor(brown);
        g.fillOval(169, 136, 12, 3);         
       }
       if(e2 && !e6)
       {
            g.setColor(Color.PINK);
            //kilia
        g.fillRoundRect(148, 140, 55, 88, 100, 40);
         //aristero xeria
        g.fillOval(90, 145,75,27);  
        //deksi xeri
        g.fillOval(190, 145,75,27);  
        //vizia
        g.setColor(Color.BLACK);
        g.fillOval(164, 162, 2, 2);
        g.fillOval(184, 162, 2, 2);
        //katw apo tin kilia
        g.setColor(Color.PINK);
        g.fillOval(150, 198, 50, 20);
        
       }    
       if(e3 && !e6)
       {
        //aristro podi
        g.setColor(Color.PINK);
        g.fillRoundRect(150, 205, 23, 120, 70, 50);
        //dksi podi
        g.fillRoundRect(180, 205, 23, 120, 70, 50);   
       }
        if(e4 && !e6)
        {
             //peos   
        g.setColor(Color.PINK);
        g.fillOval(150, 191, 50, 50);
        g.setColor(Color.BLACK);
        g.drawOval(170, 200, 12, 25);
        g.drawLine(176, 200, 176, 205);
        g.setColor(Color.BLACK);
        g.drawOval(164, 224, 12, 17);
        g.drawOval(174, 224, 12, 17);
        
        }
        if(e5 && !e6)
        {
        
        g.setColor(bbrown);
        g.fillOval(150, 530,30,20);
        g.fillOval(120, 530,30,20);
        g.fillOval(210, 530,30,20);  
        g.fillOval(180, 530,30,20); 
        g.fillOval(195, 513,30,20);
        g.fillOval(165, 513,30,20);
        g.fillOval(135, 513,30,20);
        g.fillOval(180, 496,30,20);
        g.fillOval(150, 496,30,20);
        //stoma
        
        g.setColor(Color.BLACK);
        g.drawLine(168, 122, 170, 120);
        g.drawLine(180, 120, 182, 122);
        g.setFont(f3);
        g.drawString("Είμαι γλόμπος", 200, 120);
        }
     if(e6)
     {
         
         g.setColor(back);
         g.fillRect(90,80,200,400);
         g.setColor(brown);
         g.drawLine(175, 60, 175, 120);
         //lemos
        g.setColor(Color.PINK);
        g.fillRect(169, 125, 12, 20);
        g.setColor(brown);
        g.fillOval(169, 132, 12, 3);     
         //prosopo
        g.setColor(Color.PINK);
        g.fillOval(168, 90, 44,50);
        //matia
        g.setColor(Color.BLACK);
        g.drawLine(194, 120, 195, 124);
        g.drawLine(194, 101, 195, 105);
                
        //miti
        g.setColor(Color.BLACK);
        g.drawLine(186, 108, 182, 108);
        g.drawLine(185, 113, 183, 108);
        //autia
        g.setColor(Color.PINK);
        g.fillOval(180, 85, 10, 10);
        g.fillOval(190, 135, 10, 10);
        g.setColor(Color.BLACK);
        g.fillOval(183, 87, 1, 2);
        g.fillOval(193, 139, 1, 2);
        //stoma
        g.drawLine(175, 110, 177, 120);     
       
            g.setColor(Color.PINK);
            //kilia
        g.fillRoundRect(148, 140, 55, 88, 100, 40);
         //aristero xeria
        g.fillOval(140,150,27,75);  
        //deksi xeri
        g.fillOval(185,150,27,75);  
        //vizia
        g.setColor(Color.BLACK);
        g.fillOval(164, 162, 2, 2);
        g.fillOval(184, 162, 2, 2);
        //aristro podi
        g.setColor(Color.PINK);
        g.fillRoundRect(150, 205, 23, 120, 70, 50);
        //dksi podi
        g.fillRoundRect(180, 205, 23, 120, 70, 50);   
   
        //katw apo tin kilia
        g.setColor(Color.PINK);
        g.fillOval(150, 198, 50, 20);
               
             //peos   
        g.setColor(Color.PINK);
        g.fillOval(150, 191, 50, 50);
        g.setColor(Color.BLACK); 
        g.drawOval(165, 240, 12, 17);
        g.drawOval(175, 240, 12, 17);
         g.drawOval(170, 230, 12, 25); 
         g.setColor(Color.PINK);
         g.fillOval(170, 230, 12, 25); 
         g.setColor(Color.BLACK); 
         g.drawLine(175, 250, 175, 254);
        g.setColor(brown);
        
        
        g.fillOval(150, 530,30,20);
        g.fillOval(120, 530,30,20);
        g.fillOval(210, 530,30,20);  
        g.fillOval(180, 530,30,20); 
        g.fillOval(195, 513,30,20);
        g.fillOval(165, 513,30,20);
        g.fillOval(135, 513,30,20);
        g.fillOval(180, 496,30,20);
        g.fillOval(150, 496,30,20);
       g.setColor(Color.BLACK);
       g.fillOval(175,215, 3,3);
       g.setColor(Color.YELLOW);
       int xp[]={125,135,145,155,165,175,185,195};
       int yp[]={550,300,550,320,550,340,550,310};  
       int yp2[]={550,300,550,290,550,350,550,300};
       int xp2[]={185,195,205,215,225,235,245,255,265};
       int xp3[]={120,130,140,150,160,170,180,190,200};
       int xp4[]={180,190,200,210,220,230,240,220,225};
       g.fillPolygon(xp,yp2,7);
       g.fillPolygon(xp2,yp2,7);
       g.setColor(Color.RED);
       g.fillPolygon(xp3,yp,7);
       g.fillPolygon(xp4,yp,7);
         setNOEnable();     
         if(!d)
           pa.setEnabled(true);
         replay.setEnabled(true);
         dwse.setEnabled(true);
         g.setColor(Color.RED);
         g.setFont(f2);
        g.drawString("YOU LOSE", 350,150);
        if(los){
          sum++;
          pososto=(nikes/sum)*100.0;
          los=false;
        }
    //    showStatus("itta--->sinolo: "+(int)sum+"niks:"+(int)nikes+"pososto: "+(int)pososto);
        lo=true;
     }
       
       flag=false;
                   g.setFont(f);
        if((int)pososto==0 && sum==0)
           g.setColor(Color.WHITE);
        else if((int) pososto>=50)
           g.setColor(Color.GREEN);
        else
           g.setColor(Color.RED);
        g.drawString("Score: "+(int)nikes+" / "+(int)sum+"   "+(int)pososto+"%",360,250);

        
    }
    
    public void setNOEnable(){
             alfa.setEnabled(false);  
             bita.setEnabled(false);
             gama.setEnabled(false);
             delta.setEnabled(false);              
             epslon.setEnabled(false);
             zita.setEnabled(false);
             ita.setEnabled(false);
             thita.setEnabled(false); 
             giota.setEnabled(false);                
             kapa.setEnabled(false);                
             lamda.setEnabled(false);                 
             mi.setEnabled(false); 
             ni.setEnabled(false);              
             ksi.setEnabled(false);  
             omikron.setEnabled(false);                
             pi.setEnabled(false);                
             ro.setEnabled(false);  
             sigma.setEnabled(false);
             taf.setEnabled(false); 
             ipsilon.setEnabled(false);
             fi.setEnabled(false);
             xi.setEnabled(false);
             psi.setEnabled(false);
             omga.setEnabled(false);
            
           
    }
     public void setEnable(){
             alfa.setEnabled(true);  
             bita.setEnabled(true);
             gama.setEnabled(true);
             delta.setEnabled(true);              
             epslon.setEnabled(true);
             zita.setEnabled(true);
             ita.setEnabled(true);
             thita.setEnabled(true); 
             giota.setEnabled(true);                
             kapa.setEnabled(true);                
             lamda.setEnabled(true);                 
             mi.setEnabled(true); 
             ni.setEnabled(true);              
             ksi.setEnabled(true);  
             omikron.setEnabled(true);                
             pi.setEnabled(true);                
             ro.setEnabled(true);  
             sigma.setEnabled(true);
             taf.setEnabled(true); 
             ipsilon.setEnabled(true);
             fi.setEnabled(true);
             xi.setEnabled(true);
             psi.setEnabled(true);
             omga.setEnabled(true);
             replay.setEnabled(false);
             dwse.setEnabled(false);
     }

  
   // @Override
    public void keyPressed(KeyEvent e) {
     }

    //@Override
    public void keyReleased(KeyEvent e) {
       
    }

   // @Override
    public void keyTyped(KeyEvent e) {
      int a;
      boolean fa=true;
      String stra;
   
  if(nw)
  {
         
         ch=e.getKeyChar();  
        // System.out.print(ch);
         a=Character.getNumericValue(ch);
         stra=String.valueOf(a);
        // System.out.println(stra);
  if((ch=='Α'||ch=='Β'||ch=='Γ'||ch=='Δ'||ch=='Ε'||ch=='Ζ'||ch=='Η'||ch=='Θ'||ch=='Ι'||ch=='Κ'||ch=='Λ'||ch=='Μ'||ch=='Ν'||ch=='Ξ'||ch=='Ο'||ch=='Π'||ch=='Ρ'||ch=='Σ'||ch=='Υ'||ch=='Τ'||ch=='Φ'||ch=='Χ'||ch=='Ψ'||ch=='Ω'||ch=='α'||ch=='β'||ch=='γ'||ch=='δ'||ch=='ε'||ch=='ζ'||ch=='η'||ch=='θ'||ch=='ι'||ch=='κ'||ch=='λ'||ch=='μ'||ch=='ν'||ch=='ξ'||ch=='ο'||ch=='π'||ch=='ρ'||ch=='σ'||ch=='υ'||ch=='τ'||ch=='φ'||ch=='χ'||ch=='ψ'||ch=='ω')&& stra.equals("-1"))
  {
      fa=false;
      count++;
      if(count>25)
      {    
          //showStatus("Δώσε την λέξη και πάτα Enter: "+start+" Το όριο είναι 25 χαρακτήρες.");
          orio=false;
          xar=true;
          x=false;
          glwssa=false;
          repaint();
      }
  }   
  
  if(!(ch=='Α'||ch=='Β'||ch=='Γ'||ch=='Δ'||ch=='Ε'||ch=='Ζ'||ch=='Η'||ch=='Θ'||ch=='Ι'||ch=='Κ'||ch=='Λ'||ch=='Μ'||ch=='Ν'||ch=='Ξ'||ch=='Ο'||ch=='Π'||ch=='Ρ'||ch=='Σ'||ch=='Υ'||ch=='Τ'||ch=='Φ'||ch=='Χ'||ch=='Ψ'||ch=='Ω'||ch=='α'||ch=='β'||ch=='γ'||ch=='δ'||ch=='ε'||ch=='ζ'||ch=='η'||ch=='θ'||ch=='ι'||ch=='κ'||ch=='λ'||ch=='μ'||ch=='ν'||ch=='ξ'||ch=='ο'||ch=='π'||ch=='ρ'||ch=='σ'||ch=='υ'||ch=='τ'||ch=='φ'||ch=='χ'||ch=='ψ'||ch=='ω'|| stra.equals("-1")))
    //  showStatus("Δώσε την λέξη και πάτα Enter: "+start+"                                                                                    Μόνο Ελληνικοί χαρακτήρες επιτρέπονται."); 
  {
      orio=false;                                                                                                                                                   
      glwssa=true;
      xar=false;
      repaint();
  }
    
  else
  {
      if(start.length()<=6 && stra.equals("-1") && fa)
      {
          orio=true;
          glwssa=false;
          xar=false;
          repaint();
      }
      //showStatus("Δώσε την λέξη και πάτα Enter: "+start+"Το ελάχιστο όριο ειναι 4 χαρακτήρες!");      
      else if(stra.equals("-1")&&  fa && start.length()>=6)
      {
        // fa=true;
          orio=false;
          glwssa=false;
          xar=false;
          minima=false;
         nw=false;
         pa.setEnabled(true);
         setEnable();
         start+=" ";
         //pliktro=true;
        repaint();
      }
      else if(x)
      {
          
        if(prwto==0){
            prwto=1;
           
           sq=String.valueOf(ch);
           start=sq.toUpperCase();
           repaint();
        }
        else{
            start+=" _";
            repaint();
        }
         sr+=String.valueOf(ch)+" ";
         lexi=sr.toUpperCase();
         //System.out.println(lexi);
         pliktro=true;
        // repaint();
        //showStatus("Δώσε την λέξη και πάτα Enter: "+start);
         System.out.println(start+lexi);
        }
       }
        
     }
      
  }
      
 }
    



