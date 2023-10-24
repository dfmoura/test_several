
#include <bits/stdc++.h>
using namespace std;

typedef struct
{
    string paises;
    int ouro, prata, bronze;
} Quadro_Medalhas;

int main()
{

    int n, totalOuro = 0, totalPrata = 0, totalBronze = 0;
    cin >> n;

    Quadro_Medalhas paises[n];

    for (int i = 0; i < n; i++)
    {
        cin >> paises[i].paises;
        cin >> paises[i].ouro;
        cin >> paises[i].prata;
        cin >> paises[i].bronze;
    }
/*
    for (int i = 0; i < n; i++)
    {
        cout << "País: " << paises[i].paises << endl;
        cout << "Ouro: " << paises[i].ouro << endl;
        cout << "Prata: " << paises[i].prata << endl;
        cout << "Bronze: " << paises[i].bronze << endl;
    }
*/
    cout << left << setw(20) << "País" << setw(10) << "Ouro" << setw(10) << "Prata" << setw(10) << "Bronze" << endl;
    for (int i = 0; i < n; i++)
    {
        cout << left << setw(20) << paises[i].paises;
        cout << setw(10) << paises[i].ouro;
        cout << setw(10) << paises[i].prata;
        cout << setw(10) << paises[i].bronze;
        cout << endl;
        totalOuro += paises[i].ouro;
        totalPrata += paises[i].prata;
        totalBronze += paises[i].bronze;
    }
        cout << left << setw(20) << "Total" << setw(10) << totalOuro << setw(10) << totalPrata << setw(10) << totalBronze << endl;
}
