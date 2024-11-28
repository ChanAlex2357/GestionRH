Cont# Fiche de paie

Le fiche de paie est afficher entre 2 intervalles

## Informations de base

- Nom et Prenoms
- Matricule ( idEmployee )
- Fonction ( Role )
- Num CNaPS
- Date d'embauche
- Ancienete :
    [ ] Calculer Date Fiche paie - Date d'embauche
    [ ] Calculer Date Debauche - Date d'embauche
- Classification :
- Salaire de base
  - (Salaire dans le contrat)
- Taux journalier
    [ ] Salaire de base / 30
- Taux horaire:
    [ ] Salaire de base / 173,33

## Details de paie

- Saliare du mois (01/mm/yyyy - 30/mm/yyyy)
  - Nombre de jour de travail
    [] Si 1 mois -> Salaire de base
    [] Sinon -> nombre * tauxJournaliere
- Absences Deductibles
    // Rah ohatra ka absent kanefa efa lany conge dia esorina am karamany
    -> nombreJour d'absence * taux Journaliere
- Primes divers
    [] Somme des primes de type divers
- Primmes de rendement

    [ ] Somme des primes du mois
- Primes d'anciennete
    [ ] Calculer par rapport au marge poser par la convention collective
    [ ] Si anciennete >= anciete impose -> ajouter prime
- Heures Supplementaires
    [ ] Somme par type d'heure supp
    [ ] majore 30% -> Si heure travail jour non complet
    [ ] majore 40% -> Si heure travail jour complet
    [ ] majore 50% -> Si jour de repos comme dimanche
    [ ] majore 100% -> Si jour ferier  

### En cas de rupture de contrat

- Droit de conges
    [ ] Calculer le nombre de conge non pris * taux journalier
    [ ] Exceptions
        [ ] Si typeRupture est demission ka tsy maka preavis -> alaina am conge ny preavis
- Droits de preavis
    [ ] Si licenciement et preavis non respecter
    [ ] Calculer le preavis non respectre * taux journalier
- Indemnites de licenciement
    [ ] Si type Licenciement -> recuperer la liste des indemnites
    [ ] Calculer la somme des montants d'indemnite

=> SALAIRE BRUTE (SB) = Somme des Details de paie

### Montant Imposable

- Calcul des retenus de partielle
    [ ] Calcul de retenuSalaire = SB*1%
    [ ] Retenu cnaps
        [ ] Calculer plafond -> SMIG*8%
        [ ] Retenu cnaps = min(retenuSalaire,plafond)
            [ ] si retenuSalaire < plafond -> retenuSalaire
            [ ] sinon -> plafond
    [ ] Retenu Sanitaire -> retenuSalaire
    [ ] -> Somme retenu cnaps + retenu Sanitaire
- [ ] Montant imposable (MIMP) = SB - Retenu partielle

### IRSA

- [ ] Calcul tranche(salaire , min , max , taux)
    [ ] si salaire < min -> pas de IRSA
    [ ] recuperer maxIsra(salaire,max)
    [ ] tranche = maxIsra - min
    [ ] -> IRSA = tranche * taux

- [ ] irsa += tranche(MIMP,350.000,400.000,5%)
- [ ] irsa += tranche(MIMP,400.000,500.000,10%)
- [ ] irsa += tranche(MIMP,500.000,600.000,15%)
- [ ] irsa += tranche(MIMP,600.000,MIMP,20%)

### NET A PAYER

- [ ] totalRetenus = IRSA + Retenu partielle
- [ ] SB - totalRetenus
