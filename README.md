## Installation

1. Clone this directory and ShortBRED into a local folder:

    ```bash
    git clone https://github.com/eclarke/shortbred-snakemake my_project
    cd my_project
    hg clone https://bitbucket.org/biobakery/shortbred
    ```

2. Download the marker genes for CARD from the ShortBRED website:

    ```bash
    wget https://bitbucket.org/biobakery/shortbred/downloads/ShortBRED_CARD_2017_markers.faa.gz
    gunzip ShortBRED_CARD_2017_markers.faa.gz
    ```

3. Get a copy of [USEARCH](https://www.drive5.com/usearch/download.html) for Linux and install it somewhere. 
Update the path in the Snakefile to point to wherever you installed `usearch`. By default it looks in `$HOME/bin/usearch`.

4. Create a new Conda environment with Sunbeam (assumes you have Miniconda or similar installed):
    ```bash
    conda create -n my_project -c bioconda snakemake
    ```

5. Copy or symlink your QC'd, decontaminated, paired reads to a folder in this folder (e.g. `data_files`)
    ```
    ln -s /some/other/project/sunbeam_output/assembly/paired data_files
    ```

## Running ShortBRED

1. Activate your new Conda environment: `source activate my_project`

2. Test to make sure Snakemake works correctly (in the folder we made above): `snakemake -n`. 
It should output a list of tasks it will perform (but not actually do it yet).

3. To actually run this, use the command `snakemake --use-conda` so that it creates a new Python 2.7 
environment for ShortBRED. Always use the `--use-conda` flag when running these rules. 

4. Have fun! I ran this command on PMACS, for reference: `snakemake --use-conda --cluster "bsub -n 12" -j100`
