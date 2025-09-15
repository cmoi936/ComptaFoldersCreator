using System.Text;

class Program
{
    static void Main()
    {
        // Configuration de l'encodage UTF-8 pour la console
        Console.OutputEncoding = Encoding.UTF8;
        Console.InputEncoding = Encoding.UTF8;

        Console.Write("Entrez l'année (ex: 2025) : ");
        string? inputAnnee = Console.ReadLine();

        if (!int.TryParse(inputAnnee, out int annee))
        {
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine("⚠️ Veuillez entrer une année valide (nombre).");
            Console.ResetColor();
            return;
        }

        Console.Write("Entrez le répertoire de base (laisser vide pour le répertoire courant) : ");
        string? inputBaseDir = Console.ReadLine();

        string baseDir = string.IsNullOrWhiteSpace(inputBaseDir) ? "." : inputBaseDir;

        try
        {
            bool arborescenceCreee = CreerArborescence(annee, baseDir);

            if (arborescenceCreee)
            {
                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine($"✅ Arborescence créée pour {annee} dans : {Path.GetFullPath(baseDir)}");
                Console.ResetColor();
            }
            else
            {
                Console.ForegroundColor = ConsoleColor.Cyan;
                Console.WriteLine($"ℹ️ Arborescence existe déjà pour {annee} dans : {Path.GetFullPath(baseDir)}");
                Console.ResetColor();
            }
        }
        catch (Exception ex)
        {
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine($"❌ Erreur : {ex.Message}");
            Console.ResetColor();
        }
    }

    static bool CreerArborescence(int annee, string baseDir)
    {
        string racine = Path.Combine(baseDir, annee.ToString());
        bool auMoinsUnDossierCree = false;

        for (int mois = 1; mois <= 12; mois++)
        {
            string dossierMois = Path.Combine(racine, mois.ToString("D2"));

            string[] sousDossiers = { "Achats", "Factures émises", "Relevés bancaires" };

            foreach (var sous in sousDossiers)
            {
                string chemin = Path.Combine(dossierMois, sous);
                if (!Directory.Exists(chemin))
                {
                    Directory.CreateDirectory(chemin);
                    auMoinsUnDossierCree = true;
                }
            }
        }

        return auMoinsUnDossierCree;
    }
}
