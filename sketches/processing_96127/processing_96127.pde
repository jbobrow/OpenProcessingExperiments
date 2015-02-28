

int colonnes = 2;
int rangees = 3;
int etat = 1;
int pts = 0;
int pct = 0;
int pctt = 0;
int[] q  = new int[6]; //question
int[] r  = new int[6]; //reponse
int[] m  = new int[6]; //modifie
int[] bq  = new int[6]; //bloc de question
int[] br  = new int[6]; //bloc de reponse

color couleurQ1 = color(255, 255, 255);
color couleurQ2 = color(255, 255, 255);
color couleurQ3 = color(255, 255, 255);
color couleurQ4 = color(255, 255, 255);
color couleurQ5 = color(255, 255, 255);
color couleurR1 = color(255, 255, 255);
color couleurR2 = color(255, 255, 255);
color couleurR3 = color(255, 255, 255);
color couleurR4 = color(255, 255, 255);
color couleurR5 = color(255, 255, 255);
color couleurA1 = color(0);
color couleurA2 = color(0);
color couleurA3 = color(0);
color couleurA4 = color(0);
color couleurA5 = color(0);

String[] question = {

  "Quelles sont les trois manifestations de l’intimité ?",
"Quelle est la différence entre l’état et le processus de l’intimité ?",
"Dans la vidéocassette(...) processus d’intimité sexuelle actuel = sexualisation lente ou rapide?",
"Qu’est-ce qu’a permis de constater l’étude des relations de confidence par rapport aux sujets dévoilés?",
"Qu’est-ce qu’a permis de constater l’étude des relations de confidence par rapport au sexe du confident?",
"Quelles sont les deux conditions d’une intimité sexuelle épanouissante ?",
"Quelles sont les grandes manifestations des troubles de l’intimité sexuelle ?",
"Quelle est la différence entre le modèle industriel et le modèle existentiel de l’intimité sexuelle au plan de leur philosophie respective ?",
"Quels sont les déterminants familiaux de la satisfaction sexuelle ?",
"Pour juger du degré de satisfaction sexuelle, les études ont montré le rôle prépondérant de quel facteur ?",
"Selon la théorie de l’échange interpersonnel, comment la satisfaction sexuelle se mesure-t-elle ?",
"Quelle est la définition de la dysfonction sexuelle ?",
"Quels sont les symptômes de la dysfonction sexuelle à la phase de l’excitation ?",
"Quels sont les symptômes de la dysfonction sexuelle à la phase du plateau ?",
"Quels sont les symptômes de la dysfonction sexuelle à la phase de l’orgasme ?",
"Quel est le problème sexuel le plus fréquent que ressentent les femmes?",
"Quel est le problème sexuel le plus fréquent que ressentent les hommes?",
"Si la dysfonction sexuelle est d’origine organique, suffit-il de procéder uniquement à un traitement médical pour régler le problème ?",
"Si la dysfonction sexuelle est d’origine psychologique, est-ce que les structurations psychopathologiques nécessitant un traitement psychiatrique sont rares ou fréquentes ?",
"Si la dysfonction sexuelle est d’origine sociale, quelle est la cause la plus souvent rencontrée ?",
"Différences entre la théorie de l’introspection (ex. : la psychanalyse) et la théorie de l’apprentissage (ex. : le behaviorisme)?",
"Approche thérapeutique qui explore la dynamique fantasmatique afin de surmonter les anxiétés sexuelles et de corriger les troubles sexuels ?",
"En quoi consiste la technique de compression utilisée dans le traitement behavioriste de l’éjaculation précoce ?",
"Dans la vidéocassette, on signale que le souci de réaliser une bonne performance = une source de motivation ou d’anxiété ?",
"Que signifie l’approche intégrative en sexologie clinique ?",
"Selon une enquête Royaume-Uni, les thérapies sexuelles efficaces pour problème sexuel chez les femmes?",
"Selon une enquête Royaume-Uni, les thérapies sexuelles efficaces pour problème sexuel chez les hommes?",
"Un des ingrédients de la guérison sexothérapeutique pour le client est la reconnaissance de quelle responsabilité ?",
"En quoi consiste la technique thérapeutique de Masters et Johnson qu’ils ont appelé la resensualisation ?",
"Quels sont les inconvénients d’aborder la violence sexuelle selon une perspective émotive ?",
"Quels sont les inconvénients d’aborder la violence sexuelle selon une perspective  juridique ?",
"Quels sont les inconvénients d’aborder la violence sexuelle selon une perspective idéologique ?",
"Vidéocassette sur l’agression sexuelle : est-il confirmé que les agresseurs sont la proie de pulsions sexuelles incontrôlables ?",
"Quelles sont les intentions négatives et positives de l’agressivité ?",
"Avoir une agressivité sexuelle de faible intensité, est-ce le signe d’une sexualité saine ou problématique ?",
"Au plan biologique, pourquoi l’action agressive s’accompagne-t-elle d’une excitation sexuelle ?",
"Que faut-il faire au plan bio-psychologique pour éviter un geste sexuel violent ?",
"Quels sont les facteurs qui ne favorisent pas l’inhibition de la réaction agressive ?",
"Comment s’exprime le comportement antisocial de certains violeurs ?",
"En quoi le viol peut-il témoigner d’un trouble d’identité sexuelle ?",
"En quoi le viol peut-il témoigner d’un trouble du désir sexuel?",
"En quoi le viol peut-il témoigner d’un trouble d’intimité sexuelle ?",
"Comment la socialisation contribue-t-elle à développer des scénarios sexuels violents ?",
"Selon des courants féministes, quelle est la motivation principale des violeurs ?",
"Est-ce que le viol a une signification sexuelle ?",
"Quelles sont les conséquences du viol sur la fonction sexuelle ?",
"Quelles sont les circonstances qui atténuent les répercussions sexuelles ?",
"Comment s’articulent, d’une manière interdisciplinaire, les composantes bio-psychosociales du comportement violeur ?",
"Est-ce qu’un « non » exprimé par une fille veut dire un refus catégorique et définitif d’une proposition sexuelle d’un garçon ?",
"Les victimes de harcèlement sexuel se retrouvent surtout chez les personnes âgées de quel âge ?",
"Comment s’exprime la crise du jugement moral à l’égard de la sexualité ?",
"Quelle est la différence entre une attitude amorale et immorale face à la sexualité ?",
"Quels sont les critères éthiques utilisés pour évaluer une conduite sexuelle ?",
"Quelle est la proposition morale que la sexologie pourrait préconiser suite à l’étude des agressions sexuelles ?",
"L’ordre moral nouveau en matière de sexualité préconise quel type de mécanisme pour réaliser ses finalités ?",
"En quoi l’obligation morale en matière de sexualité de l’ordre ancien se distingue-t-elle de l’ordre nouveau ?",
"Recherche d’une nouvelle morale sexuelle : rationnelle et imaginative",
"Recherche d’une nouvelle morale sexuelle : conformiste et innovatrice",
"Recherche d’une nouvelle morale sexuelle : dramatique et tragique",
"Selon des études, à quels stades de développement moral se situe la majorité de la population nord-américaine ?",
"Les Nuits fauves : quelles valeurs morales  motiveraient à informer Laura de sa séropositivité et utiliser un préservatif ?",
"Selon Kohlberg, le respect des droits sexuels correspond à quels stades du développement du jugement moral ?",
"qu’est-ce que les sexologues proposent pour solutionner le différent (clavardage d‘Annick avec un garçon qui lui écrit des mots doux) ?",
"Selon la vidéocassette présentée en classe, quels types d’informations dispensent les vidéocassettes éducatives ?",
"Quelle est la différence entre l’instruction, l’éducation et la formation en matière de sexualité ?",
"Quels sont les deux buts philosophiques de l’éducation sexuelle ?",
"Quel est le contenu de l’éducation sexuelle à partir des composantes multidimensionnelles de la sexualité ?",
"Que signifie la stylisation du comportement sexuel sécuritaire ?",
"Quels sont les éléments d’un bien-être sexuel biologique ?",
"Quels sont les éléments d’un bien-être sexuel psychologique ?",
"Quels sont les éléments d’un bien-être sexuel sociologique ?",
"Selon un sondage réalisé auprès des adolescents français, avec qui les jeunes parlent-ils le plus de sexualité ?",
"Quelles sont les trois réactions proposées en classe aux parents qui découvrent leur enfant engagé dans un jeu sexuel ?",
"(écoles américaines) quelles caractéristiques ont les élèves bénéficient le plus des interventions éducatives ?",
" Quelles sont les trois principales compétences professionnelles d’un éducateur sexuel ?",
"Selon l'auteure du livre « Alice au pays du porno », quel est le principal impact du porno sur le développement sexuel des adolescents ?",
"Quelles sont les approches et les moyens utilisés pour développer une conception intégrative de sa sexualité ?",
"Quelles sont les approches et les moyens utilisés pour développer une conception intégrative de la sexualité ?",
"Quelles sont les quatre caractéristiques d’une sexualité intégrative ?",
"Comment l’autonomie sexuelle s’exprime-t-elle ?",
"Quelles sont les valeurs associées à l’individualisation de la sexualité ?",
"Que signifie l’expression « donner un sens à sa vie sexuelle » ?",
"Quels sont les deux mots-clés utilisés en classe pour désigner l’intégration des multiples composantes de la sexualité ?",
"Selon Foucault, quel serait le but que toute personne devrait chercher à atteindre concernant sa sexualité ?",
"Quelle est la différence entre l’amour-passion et l’amour-amitié au plan de l’intensité ?",
"Quelle est la différence entre l’amour-passion et l’amour-amitié au plan de la durabilité ?",
"Selon Hendrick, quelles sont les deux composantes de l’amour = stabilité et longévité de la relation de couple ?",
"Selon Lee, quelle est la condition des relations amoureuses satisfaisantes et réussies ?",
"Comment se nomment les neurotransmetteurs qui pourraient favoriser de longues relations amoureuses satisfaisantes ?",
"Est-ce que l’adage populaire qui veut que les contraires s’attirent a été vérifié dans des études sur la rencontre amoureuse ?",
"Selon l’étude de Buss,  hommes ou femmes accordaient plus d’importance à la jeunesse et à l’apparence physique de leur partenaire ?",
"Quel mode d’attachement semble être mieux outiller les individus pour établir des relations stables et satisfaisantes ?",
"Selon des études, hommes ou femmes  définissent sentiment amoureux en termes de satisfaction sexuelle ?",
"Est-ce que la plupart des lesbiennes reportent ou non l’engagement sexuel jusqu’à ce que l’intimité affective soit établie avec leur partenaire ?",
"Quels sont les traits que les femmes et les hommes envient le plus ?",
"Dans la jalousie, hommes et femmes sont plus préoccupés par implication affective ou sexuelle de leur partenaire avec une autre personne ?",
"Quelle est la motivation des hommes et des femmes à s’engager dans des relations passagères ?",
"Les recherches indiquent qu’il y a plus de similitudes ou différences entre les modèles de communication des hommes et des femmes ?",
"Quand les gens sont mal à l’aise pour amorcer un sujet de discussion, quelle est la meilleure chose à faire ?",
"Que signifie le concept d’acceptation inconditionnelle de l’autre ?",
"Quel est l’un des meilleurs moyens de connaître les besoins de l’autre ?",
"Selon une étude, quel est l’effet sur le partenaire de discuter ouvertement de ses sentiments ?",
"Quels sont les avantages et les inconvénients des relations sur Internet ?",
"Quel est le point commun des comportements d’agression sexuelle ?",
"Tjaden et Thoenens (1998),  proportion de femmes qui disent avoir été agressée ou tentative au cours de leur vie ?",
"Quel est l’effet de croire aux mythes sur les agressions sexuelles ?",
"Est-ce que la majorité des agressions sexuelles sont commises par des individus sains d’esprit ou malades ?",
"Les agressions sexuelles sont-elles le plus souvent commises par des individus connus ou inconnus de la victime ?",
"Selon l’étude de Sanday (1981), caractéristiques des relations entre les sexes dans les sociétés où le taux d’agressions sexuelles est fort ?",
"Est-ce que l’agression sexuelle est motivée ou non par un désir d’assouvissement sexuel ?",
"Quelles sont les caractéristiques d’une personnalité narcissique ?",
"Les motivations des agresseurs sexuels qui préfèrent des victimes inconnues différent de ceux qui choisissent une victime connue ?",
"Hodge et Canter (1998), agressions contre les hommes d’orientation homosexuelle moins violentes que contre les femmes ?",
"Muehlenhard et Hollabaugh (1989), pourcentage de femmes universitaires qui s’étaient amusées à résister à des avances sexuelles pour la forme?",
"l’étude de Zoucha et Coyne (1993) résistance physique et verbale énergique vs peu de résistance = échapper au viol ?",
"Est-ce que les articles du Code pénal canadien qui traitent d’agression sexuelle incluent également les hommes comme victimes ?",
"Nombre d’hommes qui sont contraints ou menacés de blessures par des femmes pour avoir des activités sexuelles est en augmentation ?",
"Burgess et Holmstrom (1979), pourcentage des victimes de viol renonçant aux contacts sexuels durant les 6 à 12 moins suivant l’agression ?",
"Associations professionnelles reconnaissent que des souvenirs d’agressions sexuelles peuvent être réactivés plus tard dans la vie ?",
"2 facteurs qui jouent probablement un rôle très important dans la gravité des séquelles de l’abus sexuel chez les victimes ?",
"Est-ce que les difficultés sexuelles à l’âge adulte sont fortement liées à l’abus sexuel subi durant l’enfance ?",
"Est-ce que des traitements arrivent à empêcher la récidive des abus sexuels à long terme ?",
"Au Québec, est-on obligé de signaler une agression sexuelle à l’égard d’un enfant ?",
"Est-ce les jeunes femmes et les femmes célibataires ou les femmes plus âgées et mariées qui subissent davantage de harcèlement sexuel ?",
"Est-ce que des personnes peuvent avoir un problème sexuel sans pour autant être sexuellement insatisfaites ?",
"Quel terme médical désigne le rapport sexuel douloureux ?",
"La consommation de tabac peut-elle avoir de sérieux effets négatifs sur la fonction érectile ?",
"Comment les femmes ayant peu de désir sexuel interprètent-elles les attitudes de leurs parents envers le sexe ?",
"Wiederman (2000), femmes moins préoccupées par leur image corporelle se considèrent comme bonnes ou mauvaises partenaires sexuelles?",  
"Lauman et al.(1999), hommes et femmes qui ont des problèmes sexuels moins ou plus malheureux que ceux qui n’en ont pas ?",
"La recherche fait état de graves conséquences sexuelles chez les adultes qui ont des antécédents d’abus sexuels durant l’enfance ?",
"Femmes soufrant d’un désir sexuel hypoactif = moins ou plus d’insatisfaction face aux aspects relationnels de leur vie commune?",
"Une femme qui n’a pas d’orgasme = plus de difficulté à  communiquer son désir de stimulation clitoridienne directe ?",
"À quoi réfère la focalisation sensuelle dans le traitement des difficultés sexuelles ?",
"En quoi consiste la technique thérapeutique « arrêt-départ » ?",
"Les médicaments de quel trouble psychologique peuvent aider à retarder l’éjaculation ?",
"Quels sont les effets secondaires du Viagra ?",
"Que ressentent les femmes qui ont des contacts sexuels avec leur thérapeute ?",

}; 

String[] reponse = {  
 
"Proximité (phys-phys), Révélation de soi (confidence), Partage (Échange)",
"État : Vécu actuel(Situation présente) Processus : Le développement (début-évolution-fin)",
"Rapide",
"Relations avec d’autres personnes. Sujets problématiques (ventiler). Très peu de sexualité",
"Souvent confident du même sexe.",
"Identité solide, Des habiletés acquises par des expériences",
"1 Grande connexion et fusion 2 Grande séparation et isolement 3 Anxiétés",
"Industriel : Gestion et efficacité Existentiel : Échange subjectif de la rencontre (réalisation de soi)",
"Venant d'une famille plus permissive au niveau sexuel, peu religieux, précocité sexuelle.",
"Relation d’intimité",
"L'évaluation subjective des coûts et bénifices de la relation (business)",
"Difficulté d’obtenir une réponse sexuelle satisfaisante à l’une ou l’autre des phases",
"Insuffisance avec vagin desséché et anérection ou dysérection",
"Inadéquat (diminué et allongé) avec orgasme précoce ou retardé avec éjaculation prématurée",
"Absent ou déplaisant avec anéjaculation « anorgasme » ",
"Panne de désir",
"Éjaculation précoce",
"Non, problème psychologique parallèle souvent associée ou cachée.",
"Sont très variés",
"Pression de la performance, angoisse",
"Psychanalyse : Veut travailler et changer la personnalité Apprentissage : (Béhaviorisme) Modifier les comportements",
"Sexoanalyse",
"Presser la base du pénis au moment de l’arrivée de l’éjaculation (squeeze technique)",
"Anxiété",
"Approche intégrée (Physique, Psychique (cognition, émotion, comportements), Sociale (insertion, interaction, environnement)",
"Disparunie (douleur génitale)",
"Éjaculation précoce",
"Implication des clients, reconnaître qu'il fait partie du problème et/ou de la solution; rôle du thérapeute",
"Une série d’exercices tactiles pour réapprendre à avoir du plaisir (silence, paroles, caresses, coït)",
"Forte aversion aux agresseurs",
"Perte de connaissance sur les causes (sens punitif), régler juridiquement plutôt que psychologiquement",
"Empêcher de bien comprendre la situation, obstacle à la compréhension, idées déjà faites (biaisé)",
"Non, toujours contrôlable (même si difficile)",
"Positives : Constructives, réagir à la stimulation Négatives : Destructives, prend la forme de violence",
"Problématique",
"Parce que c’est le même substrat neurologique",
"Baisser l’exitation sexuelle",
"Comment l’homme se perçoit et perçoit la femme",
"Impulsif, immature, compulsif, difficilement contrôlable",
"Problème d'identité (adopte un style macho, évite les négociation, insécur)Adopte un comportement brutal, Hypermasculin",
"Désir sexuel non comblé essaie de le combler par l’agression",
"Révélation de soi rendue difficile (problème d’intimité) Viol : Une forme agressive de relation intime",
"Masculin (conquerant) Féminin (conquête) L'agression sexuelle se situe dans un processus de modèle de comportement sexuel",
"Affirmer et assurer la domination masculine, les hommes haissent les femmes, sont misogynes et s'expriment par agressivité, violence, viol.",
"Oui, pour certains violeurs",
"Traumatisme, réduction des comportements sexuels, baisse de satisfaction sexuelle ou besoin de se réapproprier sa sexualité",
"Peu de culpabilisation, support du conjoint, agresseur inconnu.",
"En intégrant les facteurs biologiques, psychologiques et sociales",
"Parfois un non veut dire oui.",
"Entre 18 et 34 ans",
"Remise en cause; Questionnement",
"Amorale : Neutre et étranger à une notion morale Immoral : À l'encontre de la morale d'une culture",
"-Bien : Bientraitance, bienfesance. -La valeur : ex : Liberté est une valeur importante -La norme -Principe",
"Moins de violence, plus de jouissance",
"Désirs sexuels libérés et exprimés : Auto contrôle (ancien : Allo contrôle) Responsable de sa sexualité",
"L'ordre ancien demande de se soumettre à la norme morale. Aujourd'hui on a l'obligation morale d'obtenir le consentement",
"Adopter une approche logique VS une approche créatrice",
"Se conformer à la morale ambiante VS générer ses valeurs et conduites",
"Étudier un dénouement heureux vs malheureux",
"Stades 1 et 2 (éviter punition et retirer  bénifices)",
"Se soucier de son bien-être et de celui de l'autre",
"5 et 6 ",
"Établir un code éthique de la vie de couple (un contrat)",
"Information pratiques et explicites.Compétences transversales",
"Instruction: Acquérir des connaissances sexuelles Éducation : Adhérer à des valeurs sexuelles Formation : Adopter des rôle sexuels",
"Dévellopement intégral de la personne, toute les dimension de l'être sexué dans ses relations",
"physique affectif cognitif comportemental moral spirituel social",
"Développer des moyens personnels d’expression de sa sexualité",
"Santé sexuelle, absence de maladies et douleurs sexuelles, fonctionnement physio-sexuel",
"Vision positive, estime de soi sexuel, contrôle sexuel",
"Relation sexuelle, acceptation et support, environnement intime et sécuritaire",
"Amis et copains",
"Discrétion, Réflexion, Communication",
"Fonctionne pour les élèves plus encadrés en milieu scolaire, plus instruits., impliqués, vivent dans un milieu régulier","Personne en harmonie, en développement, en relation Praticien informé, habile, réflexif Protagoniste lucide, critique, engagé",
"Distorsion de la réalité",
"Approche: expérimentation et réflexion; Moyens: techniques et symboliques ",
"Une approche multidisciplinaire avec des moyens écosystémiques ",
"complexe; dynamique; autonome; stimulée ",
"Être capable de se déterminer librement",
"Liberté de choix; égalité; liberté ",
"avoir un câdre de référence ",
"Unité et diversité ",
"Faire de sa vie sexuelle un chef d'oeuvre",
"Amour-passion : intense au début de la relation Amour-amitié : faible intensité",
"Amour-passion : de courte durée Amour-amitié : durable",
"Intimité et engagement",
"La découverte du partenaire qui «a la même attitude ou approche et la même définition de l’amour que soi».",
"Endorphines",
"Non",
"hommes",
"Les modes d’attachement acquis lors de leurs relations avec leurs parents (confiants)",
"hommes",
"Elles reportent",
"Femmes : la beauté physique et popularité Hommes : richesse et renommé",
"Femmes : Liaisons affectives Hommes : liaisons sexuelles",
"Hommes : Désir de variété sexuelle Femmes : Désir de sélectionner des hommes dont le statu social est élevé",
"Plus de similitudes",
"Commencer par parler de la difficulté à en parler",
"Sentiment que nous continuerons à apprécier et à se soucier de l’autre peu importe ce qu’il dira.",
"poser des questions.",
"C’est associée positivement à la satisfaction sexuelle du couple",
"Élimine le rôle de l’apparence physique. Le jugement n’a pas le temps de s’exercer. Des gens peuvent tricher. Établir des liens sociaux ",
"Absence de consentement ",
"une sur six 1/6 ",
"Accroissement de la propention d'un homme à commetre un viol",
"saint d'esprit",
"connus ",
"1Tolérence violence masculine 2Encourage garçons agressifs 3Considération de la force physique comme un idéal naturel 4Les hommes ont plus de pouvoir économique et politique 5 Les femmes sont les responsables de l'éducation et des travaux ménagers ",
"oui",
"1-Idée exagérée de sa propre importance 2-Ses déraisonnable de ses droits 3-Un manque d'empathie 4-Tendance à vouloir exploiter les autres ",
"Inconnu: Sentiment de colère, besoin d'exercer son pouvoir Connu:Désir de gratification fantasmique ou sexuelle ",
"Plus violentes ",
"39.3% ",
"résistance = échapper au viol",
"Ne font pas de distinction entre les hommes et les femmes",
"oui",
"40% ",
"Oui ",
"Usage de force; Liens étroits avec l'agresseur ",
"Oui ",
"Non ",
"Oui ",
"Jeunes femmes et femmes célibataires ",
"Oui",
"Dyspareunie ",
"Oui, reduit la frequence et la durée de l’erection",
"Negative",
"Bonne",
"Plus malheureux",
"Les consequences les plus graves sur le fonctionnement adulte",
"Plus d’insatisfaction",
"Plus de difficulté",
"Serie dexercices tactiles",
"Stimulation manuelle ou oralement. Au moment ou lhomme a le desir dejaculer, arreter la stimulation",
"Depression",
"Rougeurs, maux de tete, congestion nasale",
"Mefiante et hostile envers les homme et le therapeute, colere, honte, anxiete, depression",

};  

int rand1 = (int)random(question.length);
int rand2 = (int)random(question.length);
int rand3 = (int)random(question.length);
int rand4 = (int)random(question.length);
int rand5 = (int)random(question.length);
int rand1modif = rand1;
int rand2modif = rand2;
int rand3modif = rand3;
int rand4modif = rand4;
int rand5modif = rand5;
int swap = 0;


void setup() {
  size(800, 700);
  smooth();
  noStroke();
  int swap = (int)random(5);

  for (int i = 1; i < q.length; i++ ) {
    q[i] = 0;
    r[i] = 0;
    bq[i] = 0;
    br[i] = 0;
  }

  for (int i = 1; i < m.length; i++ ) {
    m[i] = i;
  }

  while (rand1 == rand2) {
    rand2 = (int)random(question.length);
  }

  while (rand3 == rand2 || rand3 == rand1) {
    rand3 = (int)random(question.length);
  }

  while (rand4 == rand2 || rand3 == rand4 || rand4 == rand1) {
    rand4 = (int)random(question.length);
  }

  while (rand5 == rand2 || rand3 == rand5 || rand4 == rand5 || rand5 == rand1) {
    rand5 = (int)random(question.length);
  }

  //println(question[1]);
  // println(reponse[1]);
}
void draw() { 

  fill(220);
  rect(0, 0, width, height);

  /*rand1modif = rand2;
   rand2modif = rand3;  
   rand3modif = rand4;
   rand4modif = rand1;
   rand5modif = rand5;
   
   m[1] = 2;
   m[2] = 3;
   m[3] = 4;
   m[4] = 1;
   m[5] = 5;*/

  println(swap);
  if (swap==0) {
    println("zéro");
    rand1modif = rand5;
    rand2modif = rand1;  
    rand3modif = rand4;
    rand4modif = rand3;
    rand5modif = rand2;

    m[1] = 5;
    m[2] = 1;
    m[3] = 4;
    m[4] = 3;
    m[5] = 2;
  }

  if (swap==1) {
    println("un");
    rand1modif = rand2;
    rand2modif = rand3;  
    rand3modif = rand4;
    rand4modif = rand1;
    rand5modif = rand5;

    m[1] = 2;
    m[2] = 3;
    m[3] = 4;
    m[4] = 1;
    m[5] = 5;
  }
  if (swap==2) {
    println("deux");
    rand1modif = rand1;
    rand2modif = rand5; 
    rand3modif = rand2;
    rand4modif = rand3;
    rand5modif = rand4;

    m[1] = 1;
    m[2] = 5;
    m[3] = 2;
    m[4] = 3;
    m[5] = 4;
  }
  if (swap==3) {
    println("trois");
    rand1modif = rand4;
    rand2modif = rand5; 
    rand3modif = rand3;
    rand4modif = rand2;
    rand5modif = rand1;

    m[1] = 4;
    m[2] = 5;
    m[3] = 3;
    m[4] = 2;
    m[5] = 1;
  }
  if (swap==4) {
    println("quatre");
    rand1modif = rand2;
    rand2modif = rand1;
    rand3modif = rand4;
    rand4modif = rand5;
    rand5modif = rand3;

    m[1] = 2;
    m[2] = 1;
    m[3] = 4;
    m[4] = 5;
    m[5] = 3;
  }


  if (etat <=2) {

    // Dessin des blocs

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA1);
      strokeWeight(20);
    }
    fill(couleurQ1);
    rect(10, 10, 370, 100);

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA2);
      strokeWeight(20);
    }
    fill(couleurQ2);
    rect(10, 120, 370, 100);

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA3);
      strokeWeight(20);
    }
    fill(couleurQ3);
    rect(10, 230, 370, 100);

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA4);
      strokeWeight(20);
    }
    fill(couleurQ4);
    rect(10, 340, 370, 100);

    stroke(0);
    strokeWeight(1);
    if (etat ==2) {
      stroke(couleurA5);
      strokeWeight(20);
    }
    fill(couleurQ5);
    rect(10, 450, 370, 100);

    //------------------------

    stroke(0);
    fill(255);
    rect(10, 560, 200, 75);
    
    textAlign(CENTER);
    textSize(16);
    fill(0);
    text("VÉRIFIER", 20, 570, 200, 80);

    //---------------------

    stroke(0);
    fill(couleurR1);
    rect(420, 10, 370, 100);

    stroke(0);
    fill(couleurR2);
    rect(420, 120, 370, 100);

    stroke(0);
    fill(couleurR3);
    rect(420, 230, 370, 100);

    stroke(0);
    fill(couleurR4);
    rect(420, 340, 370, 100);

    stroke(0);
    fill(couleurR5);
    rect(420, 450, 370, 100);



    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand1], 20, 20, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand2], 20, 130, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand3], 20, 240, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand4], 20, 350, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(question[rand5], 20, 460, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand1modif], 420, 20, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand2modif], 420, 130, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand3modif], 420, 240, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand4modif], 420, 350, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(reponse[rand5modif], 420, 460, 350, 80);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(pts, 515, 600);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text("/5", 530, 600);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(pct, 620, 600);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text("/", 630, 600);

    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(pctt, 640, 600);
  }
}
void mouseReleased() {
  if (etat ==1) {
    if (mouseX >10 && mouseX < 380 && mouseY >10 && mouseY < 110) {
      if (bq[1] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 1;
          bq[1] =5;
          couleurQ1 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 1;
          bq[1] =4;
          couleurQ1 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 1;
          bq[1] =3;
          couleurQ1 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 1;
          bq[1] =2;
          couleurQ1 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 1;
          bq[1] =1;
          couleurQ1 = color(0, 255, 255);
        }
      }
      else {
        if (bq[1] ==1) {
          q[1] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
        if (bq[1] ==2) {
          q[2] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
        if (bq[1] ==3) {
          q[3] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
        if (bq[1] ==4) {
          q[4] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
        if (bq[1] ==5) {
          q[5] = 0;
          bq[1] =0;
          couleurQ1 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >10 && mouseX < 380 && mouseY >120 && mouseY < 220) {
      if (bq[2] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 2;
          bq[2] =5;
          couleurQ2 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 2;
          bq[2] =4;
          couleurQ2 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 2;
          bq[2] =3;
          couleurQ2 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 2;
          bq[2] =2;
          couleurQ2 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 2;
          bq[2] =1;
          couleurQ2 = color(0, 255, 255);
        }
      }
      else {
        if (bq[2] ==1) {
          q[1] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
        if (bq[2] ==2) {
          q[2] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
        if (bq[2] ==3) {
          q[3] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
        if (bq[2] ==4) {
          q[4] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
        if (bq[2] ==5) {
          q[5] = 0;
          bq[2] =0;
          couleurQ2 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >10 && mouseX < 380 && mouseY >230 && mouseY < 330) {
      if (bq[3] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 3;
          bq[3] =5;
          couleurQ3 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 3;
          bq[3] =4;
          couleurQ3 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 3;
          bq[3] =3;
          couleurQ3 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 3;
          bq[3] =2;
          couleurQ3 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 3;
          bq[3] =1;
          couleurQ3 = color(0, 255, 255);
        }
      }
      else {
        if (bq[3] ==1) {
          q[1] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
        if (bq[3] ==2) {
          q[2] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
        if (bq[3] ==3) {
          q[3] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
        if (bq[3] ==4) {
          q[4] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
        if (bq[3] ==5) {
          q[5] = 0;
          bq[3] =0;
          couleurQ3 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >10 && mouseX < 380 && mouseY >340 && mouseY < 440) {
      if (bq[4] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 4;
          bq[4] =5;
          couleurQ4 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 4;
          bq[4] =4;
          couleurQ4 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 4;
          bq[4] =3;
          couleurQ4 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 4;
          bq[4] =2;
          couleurQ4 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 4;
          bq[4] =1;
          couleurQ4 = color(0, 255, 255);
        }
      }
      else {
        if (bq[4] ==1) {
          q[1] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
        if (bq[4] ==2) {
          q[2] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
        if (bq[4] ==3) {
          q[3] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
        if (bq[4] ==4) {
          q[4] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
        if (bq[4] ==5) {
          q[5] = 0;
          bq[4] =0;
          couleurQ4 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >10 && mouseX < 380 && mouseY >450 && mouseY < 550) {
      if (bq[5] == 0) {
        if ( q[5] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0 &&  q[4] > 0) {
          q[5] = 5;
          bq[5] =5;
          couleurQ5 = color(255, 255, 0);
        }
        if ( q[4] == 0 &&  q[1] > 0 &&  q[2] > 0 &&  q[3] > 0) {
          q[4] = 5;
          bq[5] =4;
          couleurQ5 = color(255, 180, 0);
        }
        if ( q[3] == 0 &&  q[1] > 0 &&  q[2] > 0) {
          q[3] = 5;
          bq[5] =3;
          couleurQ5 = color(0, 255, 0);
        }
        if ( q[2] == 0 &&  q[1] > 0) {
          q[2] = 5;
          bq[5] =2;
          couleurQ5 = color(255, 0, 0);
        }
        if ( q[1] == 0) {
          q[1] = 5;
          bq[5] =1;
          couleurQ5 = color(0, 255, 255);
        }
      }
      else {
        if (bq[5] ==1) {
          q[1] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
        if (bq[5] ==2) {
          q[2] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
        if (bq[5] ==3) {
          q[3] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
        if (bq[5] ==4) {
          q[4] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
        if (bq[5] ==5) {
          q[5] = 0;
          bq[5] =0;
          couleurQ5 = color(255, 255, 255);
        }
      }
    }

    //---------------------Réponses

    if (mouseX >420 && mouseX < 790 && mouseY >10 && mouseY < 110) {
      if (br[1] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 1;
          br[1] =5;
          couleurR1 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 1;
          br[1] =4;
          couleurR1 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 1;
          br[1] =3;
          couleurR1 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 1;
          br[1] =2;
          couleurR1 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 1;
          br[1] =1;
          couleurR1 = color(0, 255, 255);
        }
      }
      else {
        if (br[1] ==1) {
          r[1] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
        if (br[1] ==2) {
          r[2] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
        if (br[1] ==3) {
          r[3] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
        if (br[1] ==4) {
          r[4] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
        if (br[1] ==5) {
          r[5] = 0;
          br[1] =0;
          couleurR1 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >420 && mouseX < 790 && mouseY >120 && mouseY < 220) {
      if (br[2] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 2;
          br[2] =5;
          couleurR2 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 2;
          br[2] =4;
          couleurR2 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 2;
          br[2] =3;
          couleurR2 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 2;
          br[2] =2;
          couleurR2 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 2;
          br[2] =1;
          couleurR2 = color(0, 255, 255);
        }
      }
      else {
        if (br[2] ==1) {
          r[1] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
        if (br[2] ==2) {
          r[2] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
        if (br[2] ==3) {
          r[3] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
        if (br[2] ==4) {
          r[4] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
        if (br[2] ==5) {
          r[5] = 0;
          br[2] =0;
          couleurR2 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >420 && mouseX < 790 && mouseY >230 && mouseY < 330) {
      if (br[3] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 3;
          br[3] =5;
          couleurR3 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 3;
          br[3] =4;
          couleurR3 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 3;
          br[3] =3;
          couleurR3 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 3;
          br[3] =2;
          couleurR3 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 3;
          br[3] =1;
          couleurR3 = color(0, 255, 255);
        }
      }
      else {
        if (br[3] ==1) {
          r[1] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
        if (br[3] ==2) {
          r[2] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
        if (br[3] ==3) {
          r[3] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
        if (br[3] ==4) {
          r[4] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
        if (br[3] ==5) {
          r[5] = 0;
          br[3] =0;
          couleurR3 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >420 && mouseX < 790 && mouseY >340 && mouseY < 440) {
      if (br[4] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 4;
          br[4] =5;
          couleurR4 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 4;
          br[4] =4;
          couleurR4 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 4;
          br[4] =3;
          couleurR4 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 4;
          br[4] =2;
          couleurR4 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 4;
          br[4] =1;
          couleurR4 = color(0, 255, 255);
        }
      }
      else {
        if (br[4] ==1) {
          r[1] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
        if (br[4] ==2) {
          r[2] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
        if (br[4] ==3) {
          r[3] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
        if (br[4] ==4) {
          r[4] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
        if (br[4] ==5) {
          r[5] = 0;
          br[4] =0;
          couleurR4 = color(255, 255, 255);
        }
      }
    }

    if (mouseX >420 && mouseX < 790 && mouseY >450 && mouseY < 550) {
      if (br[5] == 0) {
        if ( r[5] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0 &&  r[4] > 0) {
          r[5] = 5;
          br[5] =5;
          couleurR5 = color(255, 255, 0);
        }
        if ( r[4] == 0 &&  r[1] > 0 &&  r[2] > 0 &&  r[3] > 0) {
          r[4] = 5;
          br[5] =4;
          couleurR5 = color(255, 180, 0);
        }
        if ( r[3] == 0 &&  r[1] > 0 &&  r[2] > 0) {
          r[3] = 5;
          br[5] =3;
          couleurR5 = color(0, 255, 0);
        }
        if ( r[2] == 0 &&  r[1] > 0) {
          r[2] = 5;
          br[5] =2;
          couleurR5 = color(255, 0, 0);
        }
        if ( r[1] == 0) {
          r[1] = 5;
          br[5] =1;
          couleurR5 = color(0, 255, 255);
        }
      }
      else {
        if (br[5] ==1) {
          r[1] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
        if (br[5] ==2) {
          r[2] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
        if (br[5] ==3) {
          r[3] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
        if (br[5] ==4) {
          r[4] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
        if (br[5] ==5) {
          r[5] = 0;
          br[5] =0;
          couleurR5 = color(255, 255, 255);
        }
      }
    }
  }

  //---vérifie

  if (mouseX >10 && mouseX < 210 && mouseY >560 && mouseY < 635) {
    if (etat ==2) { 
      etat =3;
    }
    if (etat ==1) { 
      couleurA1 = color(255, 0, 0);
      couleurA2 = color(255, 0, 0);
      couleurA3 = color(255, 0, 0);
      couleurA4 = color(255, 0, 0);
      couleurA5 = color(255, 0, 0);
      etat =2;
      if (q[1]==m[r[1]]) {
        pts += 1;
        println("q1");

        if (bq[1] == 1) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 1) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 1) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 1) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[5] == 1) {
          couleurA5 = color(0, 255, 0);
        }
      }
      if (q[2]==m[r[2]]) {
        pts += 1;
        println("q2");
        if (bq[1] == 2) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 2) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 2) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 2) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[5] == 2) {
          couleurA5 = color(0, 255, 0);
        }
      }

      if (q[3]==m[r[3]]) {
        pts += 1;
        println("q3");
        if (bq[1] == 3) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 3) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 3) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 3) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[5] == 3) {
          couleurA5 = color(0, 255, 0);
        }
      }

      if (q[4]==m[r[4]]) {
        pts += 1;
        println("q4");
        if (bq[1] == 4) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 4) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 4) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 4) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[4] == 4) {
          couleurA5 = color(0, 255, 0);
        }
      }

      if (q[5]==m[r[5]]) {
        pts += 1;
        println("q5");
        if (bq[1] == 5) {
          couleurA1 = color(0, 255, 0);
        }
        if (bq[2] == 5) {
          couleurA2 = color(0, 255, 0);
        }
        if (bq[3] == 5) {
          couleurA3 = color(0, 255, 0);
        }
        if (bq[4] == 5) {
          couleurA4 = color(0, 255, 0);
        }
        if (bq[5] == 5) {
          couleurA5 = color(0, 255, 0);
        }
      }
      pct += pts;
      pctt += 5;
    } 
    if (etat ==3) { 
      pts = 0;
      etat =1;
      swap = (int)random(5);

      for (int i = 1; i < q.length; i++ ) {
        q[i] = 0;
        r[i] = 0;
        bq[i] = 0;
        br[i] = 0;
      }

      for (int i = 1; i < m.length; i++ ) {
        m[i] = i;
      }

      while (rand1 == rand2) {
        rand2 = (int)random(question.length);
      }

      while (rand3 == rand2 || rand3 == rand1) {
        rand3 = (int)random(question.length);
      }

      while (rand4 == rand2 || rand3 == rand4 || rand4 == rand1) {
        rand4 = (int)random(question.length);
      }

      while (rand5 == rand2 || rand3 == rand5 || rand4 == rand5 || rand5 == rand1) {
        rand5 = (int)random(question.length);
      }


      rand1 = (int)random(question.length);
      rand2 = (int)random(question.length);
      rand3 = (int)random(question.length);
      rand4 = (int)random(question.length);
      rand5 = (int)random(question.length);
      rand1modif = rand1;
      rand2modif = rand2;
      rand3modif = rand3;
      rand4modif = rand4;
      rand5modif = rand5;
      couleurQ1 = color(255, 255, 255);
      couleurQ2 = color(255, 255, 255);
      couleurQ3 = color(255, 255, 255);
      couleurQ4 = color(255, 255, 255);
      couleurQ5 = color(255, 255, 255);
      couleurR1 = color(255, 255, 255);
      couleurR2 = color(255, 255, 255);
      couleurR3 = color(255, 255, 255);
      couleurR4 = color(255, 255, 255);
      couleurR5 = color(255, 255, 255);

      for (int i = 1; i < q.length; i++ ) {
        q[i] = 0;
        r[i] = 0;
        bq[i] = 0;
        br[i] = 0;
      }

      for (int i = 1; i < m.length; i++ ) {
        m[i] = i;
      }

      while (rand1 == rand2) {
        rand2 = (int)random(question.length);
      }

      while (rand3 == rand2 || rand3 == rand1) {
        rand3 = (int)random(question.length);
      }

      while (rand4 == rand2 || rand3 == rand4 || rand4 == rand1) {
        rand4 = (int)random(question.length);
      }

      while (rand5 == rand2 || rand3 == rand5 || rand4 == rand5 || rand5 == rand1) {
        rand5 = (int)random(question.length);
      }
    }
  }
}

