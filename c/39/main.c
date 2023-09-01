/*dia da samana */

#include <stdio.h>
#include <stdlib.h>
#include <locale.h>

int main() {
    setlocale(LC_ALL, "pt_PT.UTF-8");

    int dia, mes, ano, dSemana;
    const char ESC = 27;

    do {
        printf("Digite a data na forma dd mm aaaa: ");
        scanf("%d%d%d", &dia, &mes, &ano);

        if (mes < 3) {
            ano--;
            mes += 12;
        }

        dSemana = (dia + 2 * mes + (3 * (mes + 1)) / 5 + ano + (ano / 4) - (ano / 100) + (ano / 400)) % 7;

        switch (dSemana+1) {
            case 0:
                printf("Domingo");
                break;
            case 1:
                printf("Segunda-Feira");
                break;
            case 2:
                printf("Terça-Feira");
                break;
            case 3:
                printf("Quarta-Feira");
                break;
            case 4:
                printf("Quinta-Feira");
                break;
            case 5:
                printf("Sexta-Feira");
                break;
            case 6:
                printf("Sábado");
                break;
        }

        printf("\nESC para terminar ou ENTER para recomeçar\n");
        getchar();

    } while (getchar() != ESC);

    printf("\n");
    return 0;
}
