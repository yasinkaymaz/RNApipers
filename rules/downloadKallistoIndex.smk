#Downloads kallisto human transcriptome index from Pachterlab's website
rule downloadKallistoIndex:
    output:
      "homo_sapiens/Homo_sapiens.GRCh38.96.gtf",
      "homo_sapiens/Homo_sapiens.GRCh38.cdna.all.fa",
      "homo_sapiens/transcriptome.idx",
      "homo_sapiens/transcripts_to_genes.txt"
    conda:
      "env.yml"
    shell:
      'wget https://github.com/pachterlab/kallisto-transcriptome-indices/releases/download/ensembl-96/homo_sapiens.tar.gz && \
      tar xvzf homo_sapiens.tar.gz'
