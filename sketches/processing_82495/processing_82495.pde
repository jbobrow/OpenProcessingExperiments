
import java.awt.*;
import java.net.* ;
import java.util.* ;
import java.io.* ;
import java.lang.* ;
import java.awt.event.*;
import javax.swing.*;

import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

PImage PatrimoineImage;
PImage FondEcran;
PFont police;
String nom_patrimoine;

public class Fenetre extends JFrame implements WindowListener, ActionListener,ItemListener
{
    private Choice liste_region;
    private Choice liste_patrimoine;
    private JTextArea description_patrimoine;
    private PileRegion pr;
    
    public Fenetre (PileRegion pr)
    {
        super("Patrimoine Français...") ;
        
        this.setLayout(new FlowLayout ()) ;
                    
        this.addWindowListener(this);
        
        this.pr = pr;
        
        this.liste_region = new Choice ();
        this.liste_region.addItem("(Région)"); 
        for(int i=0;i<this.pr.NombreElement();i++)
          this.liste_region.addItem(this.pr.accedeRegion(i).Nom());
        this.liste_region.addItemListener(this);
        this.add(this.liste_region);
        
        this.liste_patrimoine = new Choice();
        this.liste_patrimoine.addItem("(Patrimoine)");
        this.liste_patrimoine.addItemListener(this);
        this.add(this.liste_patrimoine);
        
        this.description_patrimoine = new JTextArea("Description du patrimoine...");
        this.description_patrimoine.setEditable(false);
        this.add(this.description_patrimoine);
        
        this.pack () ;
        this.setVisible(true) ;
    }

    public void windowDeactivated (WindowEvent e){}
    public void windowActivated (WindowEvent e){}
    public void windowDeiconified (WindowEvent e){}
    public void windowIconified (WindowEvent e){}
    public void windowClosed (WindowEvent e){}
    public void windowClosing (WindowEvent e){
        System.exit(0);}
    public void windowOpened (WindowEvent e){}
    public void actionPerformed(ActionEvent e){}
    public void itemStateChanged(ItemEvent ie)
    { 
      if(ie.getItem()=="(Région)"|| ie.getItem()=="(Patrimoine)")
      {
        this.description_patrimoine.setText("Description du patrimoine...");
        this.validate();
        this.pack();
        etat = 0;
      }      
      else
      {
        for(int i=0;i<this.pr.NombreElement();i++)
        {
          for(int k=0;k<this.pr.accedeRegion(i).NombreElement();k++)
          {
            if(this.pr.accedeRegion(i).accedePatrimoine(k).Nom()==ie.getItem())
            {
              this.description_patrimoine.setText(this.pr.accedeRegion(i).accedePatrimoine(k).Description());
              this.validate();
              this.pack();
              
              etat = 1;
              nom_patrimoine = this.pr.accedeRegion(i).accedePatrimoine(k).Nom()+".gif";

            }
          }
          if(this.pr.accedeRegion(i).Nom()==ie.getItem())
          {
            while(this.liste_patrimoine.getItemCount()>1)
               this.liste_patrimoine.remove(1);
            
            for(int j=0;j<this.pr.accedeRegion(i).NombreElement();j++)
            {
              this.liste_patrimoine.addItem(this.pr.accedeRegion(i).accedePatrimoine(j).Nom());
            }
          }
        }
      }
    }
}

public class Patrimoine
{
  private String nom;
  private String description;
  
  public Patrimoine()
  {
    this.nom = "";
    this.description = "";
  }
  
  public Patrimoine(String n, String d)
  {
    this.nom = n;
    this.description = d;
  }
  
  public String Nom()
  {
    return this.nom;
  }
  
  public String Description()
  {
    return this.description;
  }
  
  public void modifNom(String n)
  {
    this.nom = n;
  }
  
  public void modifDescripton(String d)
  {
    this.description = d;
  }
}

public class Region
{
  private String nom;
  private Patrimoine[] pile_patrimoine;
  private int nbre_element;
  private int nbre_max;
  
  public Region()
  {
    this.nom = "";
    this.pile_patrimoine = new Patrimoine[1];
    this.nbre_element = 0;
    this.nbre_max = 1;
  }
  
  public Region(String n, int nm)
  {
    this.nom = n;
    this.pile_patrimoine = new Patrimoine[nm];
    this.nbre_element = 0;
    this.nbre_max = nm;
  }
  
  public int NombreElement()
  {
    return this.nbre_element;
  }
  
  public int NombreMax()
  {
    return this.nbre_max;
  }
  
  public String Nom()
  {
    return this.nom;
  }
  
  public void ajoutePatrimoine(Patrimoine m)
  {
    if(this.nbre_element < this.nbre_max)
    {
      this.pile_patrimoine[this.nbre_element] = m;
      this.nbre_element++;
    }
    else
      println("le nombre max de patrimoines est atteint");
  }
  
  public Patrimoine accedePatrimoine(int i)
  {
    if(i>=0&&i<this.nbre_element)
      return this.pile_patrimoine[i];
    else
      println("le patrimoine "+i+" n'est pas valide");
    return null;
  }
}

public class PileRegion
{
  private Region[] tab_region;
  private int nbre_element;
  private int nbre_max;
  
  public PileRegion()
  {
    this.tab_region = new Region[22];
    this.nbre_element = 0;
    this.nbre_max = 22;
  }
  
  public PileRegion(int nm)
  {
    this.tab_region = new Region[nm];
    this.nbre_element = 0;
    this.nbre_max = nm;
  }
  
  public int NombreElement()
  {
    return this.nbre_element;
  }
  
  public int NombreMax()
  {
    return this.nbre_max;
  }
  
  public void ajouteRegion(Region r)
  {
    if(this.nbre_element < this.nbre_max)
    {
      this.tab_region[this.nbre_element] = r;
      this.nbre_element++;
    }
    else
      println("le nombre max de regions est atteint");
  }
  
  public Region accedeRegion(int i)
  {
    if(i>=0&&i<this.nbre_element)
      return this.tab_region[i];
    else
      println("la region "+i+" n'est pas valide");
    return null;
  }
}

PileRegion pile_region = new PileRegion();
int etat;

void setup()
{
  nom_patrimoine = "";
  etat = 0;
  
  // Mise en forme de la page
  FondEcran =  loadImage("FondEcran.jpg");
  size(FondEcran.width,FondEcran.height);
  image (FondEcran,0,0);

  police = loadFont("police.vlw");
  textFont(police,60);
  text("Le patrimoine français",0,FondEcran.height/15);

  Patrimoine Vieil_Armand = new Patrimoine ("Vieil-Armand","Nommé aussi Hartmannswillerkopf est un éperon\n rocheux pyramidal, dans le massif des Vosges.");
  Region Alsace = new Region("Alsace",1);
  Alsace.ajoutePatrimoine (Vieil_Armand);
  pile_region.ajouteRegion(Alsace);

  Patrimoine Cathedrale_Saint_Andre = new Patrimoine ("Cathédrale Saint-André","La Cathedrale Saint-André est située sur\n la place Pey-Berland et est le lieu\n de culte le plus imposant de Bordeaux.");
  Region Aquitaine = new Region("Aquitaine",1);
  Aquitaine.ajoutePatrimoine (Cathedrale_Saint_Andre);
  pile_region.ajouteRegion(Aquitaine);

  Patrimoine Cathedrale_Notre_Dame_de_lAssomption = new Patrimoine ("Cathédrale Notre-Dame-de-l'Assomption","Sa somptueuse cathédrale est inscrite au\n patrimoine mondial de l'Unesco.");
  Region Auvergne = new Region("Auvergne",1);
  Auvergne.ajoutePatrimoine (Cathedrale_Notre_Dame_de_lAssomption);
  pile_region.ajouteRegion(Auvergne);

  Patrimoine Mont_Saint_Michel = new Patrimoine ("Mont Saint-Michel","Le mont Saint-Michel est un îlot d’environ\n 960 mètres de circonférence situé à l’est de\n l’embouchure du fleuve du Couesnon, dans le\n département de la Manche.");
  Region Basse_Normandie = new Region("Basse_Normandie",1);
  Basse_Normandie.ajoutePatrimoine (Mont_Saint_Michel);
  pile_region.ajouteRegion(Basse_Normandie);

  Patrimoine Parc_naturel_regional_du_Morvan = new Patrimoine ("Parc naturel régional du Morvan","Situé dans le massif du Morvan, au cœur\n de la région Bourgogne. Créé en 1970.");
  Region Bourgogne = new Region("Bourgogne",1);
  Bourgogne.ajoutePatrimoine (Parc_naturel_regional_du_Morvan);
  pile_region.ajouteRegion(Bourgogne);

  Patrimoine Carnac = new Patrimoine ("Carnac","Carnac est une commune française située\n dans le département du Morbihan.");
  Region Bretagne = new Region("Bretagne",1);
  Bretagne.ajoutePatrimoine (Carnac);
  pile_region.ajouteRegion(Bretagne);

  Patrimoine Cathedrale_Saint_Etienne_de_Bourges = new Patrimoine ("Cathédrale Saint-Étienne de Bourges","La cathédrale Saint-Étienne de Bourges, construite\n entre la fin du xiie et la fin du xiiie siècle est\n le siège du diocèse de Bourges");
  Region Centre = new Region("Centre",1);
  Centre.ajoutePatrimoine (Cathedrale_Saint_Etienne_de_Bourges);
  pile_region.ajouteRegion(Centre);

  Patrimoine Cathedrale_Notre_Dame_de_Reims = new Patrimoine ("Cathédrale Notre-Dame de Reims","Notre-Dame de Reims est une cathédrale du xiiie\n siècle consacrée à la Vierge Marie, la cathédrale\n a été achevée au xive siècle.");
  Region Champagne_Ardenne = new Region("Champagne_Ardenne",1);
  Champagne_Ardenne.ajoutePatrimoine (Cathedrale_Notre_Dame_de_Reims);
  pile_region.ajouteRegion(Champagne_Ardenne);

  Patrimoine Tour_genoise = new Patrimoine ("Tour génoise","Les tours génoises est une expression qui définit\n un ensemble de tours côtières disposé le long\n du littoral des anciens territoires de la\n République de Gênes.");
  Region Corse = new Region("Corse",1);
  Corse.ajoutePatrimoine (Tour_genoise);
  pile_region.ajouteRegion(Corse);

  Patrimoine Musee_du_Temps_de_Besancon = new Patrimoine ("Musée du Temps de Besançon","Le musée du Temps de Besançon est un musée\n d'horlogerie de Besançon dans le Doubs en\n Franche-Comté installé dans un des plus beaux\n palais de la ville, le Palais Granvelle.");
  Region Franche_Comte = new Region("Franche_Comte",1);
  Franche_Comte.ajoutePatrimoine (Musee_du_Temps_de_Besancon);
  pile_region.ajouteRegion(Franche_Comte);

  Patrimoine Abbaye_de_Jumieges = new Patrimoine ("Abbaye de Jumièges","L'abbaye Saint-Pierre de Jumièges fut fondée\n par saint Philibert, fils d'un comte franc de\n Gascogne vers 6541 sur un domaine du fisc\n royal à Jumièges.");
  Region Haute_Normandie = new Region("Haute_Normandie",1);
  Haute_Normandie.ajoutePatrimoine (Abbaye_de_Jumieges);
  pile_region.ajouteRegion(Haute_Normandie);

  Patrimoine Tour_eiffel = new Patrimoine ("Tour Eiffel","La tour Eiffel est une tour de fer puddlé de 324\n mètres de hauteur, située à l’extrémité nord-ouest du\n parc du Champ-de-Mars en bordure de la Seine.");
  Patrimoine Cathedrale_Notre_Dame_de_Paris = new Patrimoine ("Cathédrale Notre-Dame de Paris","Elle est située sur la moitié est de l’île de la Cité, dans\n le quatrième arrondissement de Paris.");
  Patrimoine Musee_du_Louvre = new Patrimoine ("Musée du Louvre","Le musée du Louvre est l'un des plus grands musées\n du monde et le plus grand musée de Paris par\n sa surface de 210 000 m2 dont 60 600 consacrés\n aux expositions.");
  Region Ile_de_France = new Region("Ile_de_France",3);
  Ile_de_France.ajoutePatrimoine (Tour_eiffel);
  Ile_de_France.ajoutePatrimoine (Cathedrale_Notre_Dame_de_Paris);
  Ile_de_France.ajoutePatrimoine (Musee_du_Louvre);
  pile_region.ajouteRegion(Ile_de_France);

  Patrimoine Abbaye_Saint_Martin_du_Canigou = new Patrimoine ("Abbaye Saint-Martin du Canigou","L’abbaye Saint-Martin du Canigou a été fondée\n au xe siècle par Guifred II comte de Cerdagne.");
  Region Languedoc_Roussillon = new Region("Languedoc_Roussillon",1);
  Languedoc_Roussillon.ajoutePatrimoine (Abbaye_Saint_Martin_du_Canigou);
  pile_region.ajouteRegion(Languedoc_Roussillon);

  Patrimoine Abbatiale_Saint_Pierre_de_Beaulieu_sur_Dordogne = new Patrimoine ("Abbatiale Saint-Pierre de Beaulieu-sur-Dordogne","L'Abbatiale saint-Pierre de Beaulieu-sur-Dordogne\n est une abbaye bénédictine située à Beaulieu-sur-Dordogne\n dans le département de la Corrèze.");
  Region Limousin = new Region("Limousin",1);
  Limousin.ajoutePatrimoine (Abbatiale_Saint_Pierre_de_Beaulieu_sur_Dordogne);
  pile_region.ajouteRegion(Limousin);

  Patrimoine Place_Stanislas = new Patrimoine ("Place Stanislas","La place Stanislas est une place appartenant à un ensemble\n urbain classique situé à Nancy, qui est inscrit\n au patrimoine mondial de l'UNESCO.");
  Region Lorraine = new Region("Lorraine",1);
  Lorraine.ajoutePatrimoine (Place_Stanislas);
  pile_region.ajouteRegion(Lorraine);


  Patrimoine Chateau_de_Gramont = new Patrimoine ("Château de Gramont","Le château de Gramont est un château du Sud-Ouest\n de la France. Situé dans le département de Tarn-et-Garonne\n à la limite du département du Gers dans la commune de Gramont.");
  Region Midi_Pyrenees = new Region("Midi-Pyrénées",1);
  Midi_Pyrenees.ajoutePatrimoine (Chateau_de_Gramont);
  pile_region.ajouteRegion(Midi_Pyrenees);

  Patrimoine Abbaye_Saint_Vaast = new Patrimoine ("Abbaye Saint-Vaast","L'abbaye Saint-Vaast était un monastère bénédictin fondé en 667\n sur la colline de La Madeleine près d'Arras, où le futur\n saint Vaast avait coutume de se retirer."); 
  Region Nord_Pas_de_Calais = new Region("Nord-Pas-de-Calais",1);
  Nord_Pas_de_Calais.ajoutePatrimoine (Abbaye_Saint_Vaast);
  pile_region.ajouteRegion(Nord_Pas_de_Calais);

  Patrimoine Chateau_d_Angers = new Patrimoine ("Château d'Angers","Le château d'Angers, aussi appelé château des ducs d'Anjou1,\n est situé dans la ville d’Angers dans le département de\n Maine-et-Loire en France."); 
  Region Pays_de_la_Loire = new Region("Pays de la Loire",1);
  Pays_de_la_Loire.ajoutePatrimoine (Chateau_d_Angers);
  pile_region.ajouteRegion(Pays_de_la_Loire);

  Patrimoine Cathedrale_Notre_Dame_d_Amiens = new Patrimoine ("Cathédrale Notre-Dame d'Amiens","La cathédrale Notre-Dame d’Amiens est la plus vaste\n de France par ses volumes intérieurs (200 000 m3)."); 
  Region Picardie = new Region("Picardie",1);
  Picardie.ajoutePatrimoine (Cathedrale_Notre_Dame_d_Amiens);
  pile_region.ajouteRegion(Picardie);

  Patrimoine Tour_Saint_Nicolas = new Patrimoine ("Tour Saint-Nicolas","La tour Saint-Nicolas (xive siècle) est l'une des trois tours\n du front de mer de La Rochelle, et l'une des deux tours emblématiques\n du Vieux-Port, dont elle constitue la majestueuse porte d'entrée."); 
  Region Poitou_Charentes = new Region("Poitou-Charentes",1);
  Poitou_Charentes.ajoutePatrimoine (Tour_Saint_Nicolas);
  pile_region.ajouteRegion(Poitou_Charentes);

  Patrimoine Abbaye_Saint_Victor_de_Marseille = new Patrimoine ("Abbaye Saint-Victor de Marseille","L'abbaye Saint-Victor de Marseille a été fondée au ve siècle\n par Jean Cassien."); 
  Region Provence_Alpes_Cote_d_Azur = new Region("Provence-Alpes-Côte d'Azur",1);
  Provence_Alpes_Cote_d_Azur.ajoutePatrimoine (Abbaye_Saint_Victor_de_Marseille);
  pile_region.ajouteRegion(Provence_Alpes_Cote_d_Azur);

  Patrimoine Stade_de_Gerland = new Patrimoine ("Stade de Gerland","Le stade de Gerland est la principale enceinte\n sportive de la ville de Lyon. "); 
  Region Rhone_Alpes = new Region("Rhône-Alpes",1);
  Rhone_Alpes.ajoutePatrimoine (Stade_de_Gerland);
  pile_region.ajouteRegion(Rhone_Alpes);
  
  
  Fenetre fenetre = new Fenetre(pile_region);
}

void draw()
{   
    if(etat == 1)
    {
      PatrimoineImage = loadImage(nom_patrimoine);
      image (PatrimoineImage,FondEcran.width*0.4,FondEcran.height*0.3);
      etat = 0;
    }
}
